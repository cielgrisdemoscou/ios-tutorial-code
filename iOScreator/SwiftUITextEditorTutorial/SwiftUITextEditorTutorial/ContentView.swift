//
//  ContentView.swift
//  SwiftUITextEditorTutorial
//
//  Created by Ted Hyeong on 11/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var text: String = "Enter some text: "
    
    var body: some View {
        VStack {
            TextEditor(text: $text)
                .padding()
                .foregroundColor(Color.red)
                .font(.title)
            
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .border(Color.black, width: 1)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
