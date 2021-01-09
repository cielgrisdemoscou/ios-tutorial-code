//
//  ContentView.swift
//  SwiftUIAddRowsListTutorial
//
//  Created by Ted Hyeong on 09/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var locations = ["Beach", "Forest", "Desert"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(locations, id: \.self) { location in
                    Text(location)
                }
            }
            .navigationTitle(Text("Locations"))
            .navigationBarItems(trailing: Button(action: {
                self.addRow()
            }, label: {
                Image(systemName: "plus")
            }))
        }
    }
    private func addRow() {
        self.locations.append("New locations")
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
