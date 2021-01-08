//
//  ContentView.swift
//  SwiftUIDeleteRowsListTutorial
//
//  Created by Ted Hyeong on 08/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animals = ["Dog", "Cat", "Cow", "Sheep", "Snake"]
    
    var body: some View {
        
        NavigationView {
            // 2.
            List {
                ForEach(animals, id: \.self) { animal in
                    Text(animal)
                }
                // 3.
                .onDelete(perform: self.deleteRow)
            }
            .navigationBarTitle(Text("Animals"))
        }
    }
    // 4.
    private func deleteRow(at indexSet: IndexSet) {
        self.animals.remove(atOffsets: indexSet)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
