/// Copyright (c) 2020 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import CoreData
import Combine
import os.log

class PersistenceController: ObservableObject {
  static let shared = PersistenceController()

  var viewContext: NSManagedObjectContext {
    return container.viewContext
  }

  let container: NSPersistentContainer
  private var subscriptions: Set<AnyCancellable> = []
  private lazy var dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM d, yyyy"
    return formatter
  }()

  init(inMemory: Bool = false) {
    container = NSPersistentContainer(name: "FireballWatch")
    let persistentStoreDescription = container.persistentStoreDescriptions.first

    if inMemory {
      persistentStoreDescription?.url = URL(fileURLWithPath: "/dev/null")
    }

    container.loadPersistentStores { _, error in
      if let error = error as NSError? {
        os_log(.error, log: .default, "Error loading persistent store %@", error)
      }
    }
    viewContext.automaticallyMergesChangesFromParent = true
  }

  func saveViewContext() {
    guard viewContext.hasChanges else { return }

    do {
      try viewContext.save()
    } catch {
      let nsError = error as NSError
      os_log(.error, log: .default, "Error saving changes %@", nsError)
    }
  }

  func deleteManagedObjects(_ objects: [NSManagedObject]) {
    viewContext.perform { [context = viewContext] in
      objects.forEach(context.delete)
      self.saveViewContext()
    }
  }

  func addNewFireballGroup(name: String) {
    viewContext.perform { [context = viewContext] in
      let group = FireballGroup(context: context)
      group.id = UUID()
      group.name = name
      self.saveViewContext()
    }
  }

  func fetchFireballs() {
    let source = RemoteDataSource()
    os_log(.info, log: .default, "Fetching fireballs...")
    source.fireballDataPublisher
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { _ in
        os_log(.info, log: .default, "Fetching completed")
      }, receiveValue: { [weak self] in
        self?.importFetchedFireballs($0)
      })
      .store(in: &subscriptions)
  }

  private func importFetchedFireballs(_ fireballs: [FireballData]) {
    os_log(.info, log: .default, "Importing \(fireballs.count) fireballs")
    container.performBackgroundTask { context in
      context.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
      fireballs.forEach {
        let managedObject = Fireball(context: context)
        managedObject.dateTimeStamp = $0.dateTimeStamp
        managedObject.radiatedEnergy = $0.radiatedEnergy
        managedObject.impactEnergy = $0.impactEnergy
        managedObject.latitude = $0.latitude
        managedObject.longitude = $0.longitude
        managedObject.altitude = $0.altitude
        managedObject.velocity = $0.velocity

        do {
          try context.save()
        } catch {
          let nsError = error as NSError
          os_log(.error, log: .default, "Error importing fireball %@", nsError)
        }
      }
    }
  }
}

extension PersistenceController {
  static var preview: PersistenceController = {
    let controller = PersistenceController(inMemory: true)
    controller.viewContext.perform {
      for i in 0..<100 {
        controller.makeRandomFireball(context: controller.viewContext)
      }
      for i in 0..<5 {
        controller.makeRandomFireballGroup(context: controller.viewContext)
      }
    }
    return controller
  }()

  @discardableResult
  func makeRandomFireball(context: NSManagedObjectContext) -> Fireball {
    let fireball = Fireball(context: context)
    let timeSpan = Date().timeIntervalSince1970
    fireball.dateTimeStamp = Date(timeIntervalSince1970: Double.random(in: 0...timeSpan))
    fireball.radiatedEnergy = Double.random(in: 0...3)
    fireball.impactEnergy = Double.random(in: 0...400)
    fireball.latitude = Double.random(in: -90...90)
    fireball.longitude = Double.random(in: -180...180)
    fireball.altitude = Double.random(in: 1...20)
    fireball.velocity = Double.random(in: 200...2000)
    return fireball
  }

  @discardableResult
  func makeRandomFireballGroup(context: NSManagedObjectContext) -> FireballGroup {
    let group = FireballGroup(context: context)
    group.id = UUID()
    group.name = "Random Group"
    return group
  }
}
