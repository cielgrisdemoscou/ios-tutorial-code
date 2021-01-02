//
//  ContentView.swift
//  SwiftUITextViewTutorial
//
//  Created by Ted Hyeong on 02/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
            
            Text("Dynamic Types Example")
                .font(.largeTitle)
            
            Text("Color Example")
                .foregroundColor(Color.white)
                .background(Color.gray)
            
            Text("Kerning Example")
                .kerning(10)
            
            Text("Style Example")
                .bold()
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                .lineLimit(nil)
                .lineSpacing(10)
                .multilineTextAlignment(.center)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
