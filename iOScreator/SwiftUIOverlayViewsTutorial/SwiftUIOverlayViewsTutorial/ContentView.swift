//
//  ContentView.swift
//  SwiftUIOverlayViewsTutorial
//
//  Created by Ted Hyeong on 08/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("Apple_Swift_Logo")
            .resizable()
            .scaledToFit()
            .overlay(
            Text("Swift")
                .foregroundColor(.gray)
                .font(.largeTitle)
                ,alignment: .bottomTrailing)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
