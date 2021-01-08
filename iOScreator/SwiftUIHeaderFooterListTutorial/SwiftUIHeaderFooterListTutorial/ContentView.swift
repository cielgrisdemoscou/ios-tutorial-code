//
//  ContentView.swift
//  SwiftUIHeaderFooterListTutorial
//
//  Created by Ted Hyeong on 08/01/2021.
//

import SwiftUI

struct ContentView: View {
    let europeanCars = ["Audi", "Renault", "Ferrari"]
    let asianCars = ["Honda","Nissan","Hyundai"]
    
    var body: some View {
        NavigationView {
            List {
                // 2.
                Section(header:
                    Text("European Cars")) {
                        ForEach(0 ..< europeanCars.count) {
                            Text(self.europeanCars[$0])
                        }
                    }
                // 3.
                Section(header:
                    HStack {
                        Image(systemName: "car")
                        Text("Asian Cars")
                    }
                // 4.
                , footer: Text("This is a example list of a few car brands").font(.footnote))  {
                               ForEach(0 ..< asianCars.count) {
                                   Text(self.asianCars[$0])
                               }
                           }
            
            } .navigationBarTitle("Cars")
        }
           
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
