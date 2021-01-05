//
//  ContentView.swift
//  SwiftUIEnvironmentObjectTutorial
//
//  Created by Ted Hyeong on 05/01/2021.
//

import SwiftUI

class GameSettings: ObservableObject {
    @Published var score: Int = 0
}

struct ContentView: View {
    // 1.
    @EnvironmentObject var settings: GameSettings
    
    var body: some View {
        
        NavigationView {
            VStack {
                // 2.
                Stepper(value: $settings.score, in: 1...1000000, step: 1000,  label: {
                    Text("Current Score:  \(settings.score)")
                }).padding()
                // 3.
                NavigationLink(destination: ScoreView()) {
                    Text("Show Current Score")
                }
            }
        }
    }
}

struct ScoreView: View {
    @EnvironmentObject var settings: GameSettings
    
    var body: some View {
        Text("Score: \(settings.score)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
