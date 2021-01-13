//
//  ContentView.swift
//  SwiftUIGroupBoxTutorial
//
//  Created by Ted Hyeong on 13/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    
    var body: some View {
        VStack {
            GroupBox(label: Label("Heart rate", systemImage: "heart.fill").font(.largeTitle)) {
                Text("69 BPM").font(.title)
            }
            
            GroupBox {
                Text("Enter your name").font(.title)
                TextField("name", text: $name)
            }
            
            Spacer()
        }.padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
