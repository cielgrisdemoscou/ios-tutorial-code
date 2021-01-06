//
//  ContentView.swift
//  SwiftUIShadowTutorial
//
//  Created by Ted Hyeong on 04/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .foregroundColor(Color.red)
            .font(.title)
            .bold()
            .padding()
            .shadow(color: Color.gray, radius: 3, x:15, y: 20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
