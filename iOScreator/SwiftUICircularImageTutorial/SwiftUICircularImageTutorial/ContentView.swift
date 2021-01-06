//
//  ContentView.swift
//  SwiftUICircularImageTutorial
//
//  Created by Ted Hyeong on 05/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("Apple_Swift_Logo")
            .clipShape(Circle())
            .shadow(radius: 10)
            .overlay(Circle().stroke(Color.red, lineWidth: 5))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
