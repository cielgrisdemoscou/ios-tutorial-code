//
//  ContentView.swift
//  SwiftUITextFieldTutorial
//
//  Created by Ted Hyeong on 04/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State var name: String = ""
    
    var body: some View {
        VStack {
            TextField(" Enter some text", text: $name)
                .border(Color.black)
            Text("Text entered: ")
            Text("\(name)")
        }
        .padding()
        .font(.title)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
