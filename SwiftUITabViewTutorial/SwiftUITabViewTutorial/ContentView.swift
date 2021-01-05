//
//  ContentView.swift
//  SwiftUITabViewTutorial
//
//  Created by Ted Hyeong on 05/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // 1
        TabView {
            // 2
            HomeView()
                // 3
                .tabItem {
                    VStack {
                        Image(systemName: "1.circle")
                        Text("Home")
                    }
            // 4
            }.tag(1)
            
            // 5
            AboutView()
                .tabItem {
                    VStack {
                        Image(systemName: "2.circle")
                        Text("About")
                    }
            }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
