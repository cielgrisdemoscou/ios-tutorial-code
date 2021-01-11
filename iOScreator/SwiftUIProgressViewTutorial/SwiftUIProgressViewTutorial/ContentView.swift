//
//  ContentView.swift
//  SwiftUIProgressViewTutorial
//
//  Created by Ted Hyeong on 11/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var progress = 0.0
    
    var body: some View {
        VStack(spacing: 30) {
            ProgressView("Progress", value: progress, total: 100)
            
            Button("Increment Progress") {
                if progress < 100 {
                    progress += 10
                }
            }
            Text("Current Progress: \(Int(progress))%")
            Spacer()
        }
        .padding(.all, 10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
