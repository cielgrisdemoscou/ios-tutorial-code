//
//  ContentView.swift
//  SwiftUIPickerTutorial
//
//  Created by Ted Hyeong on 03/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    let colors = ["Red", "Yellow", "Green", "Blue"]
    
    var body: some View {
        Picker(selection: $selection, label: Text("Picker Name"), content: /*@START_MENU_TOKEN@*/{
            ForEach(0 ..< colors.count) { index in
                Text(self.colors[index]).tag(index)
            }
        }/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
