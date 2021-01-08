//
//  ContentView.swift
//  SwiftUISpringAnimationTutorial
//
//  Created by Ted Hyeong on 08/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var rotatingAngle: Double = 0
    
    var body: some View {
        Button(action: {
            self.rotatingAngle += 90
        }, label: {
            Rectangle()
                .fill(Color.red)
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(rotatingAngle))
                .animation(.interpolatingSpring(mass: 1, stiffness: 1, damping: 0.5, initialVelocity: 1))
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
