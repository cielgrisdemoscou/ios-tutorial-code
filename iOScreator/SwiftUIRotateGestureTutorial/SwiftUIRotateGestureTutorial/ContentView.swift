//
//  ContentView.swift
//  SwiftUIRotateGestureTutorial
//
//  Created by Ted Hyeong on 07/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var rotateState: Double = 0
    
    var body: some View {
        Image("Apple_Swift_Logo")
            .rotationEffect(Angle(degrees: self.rotateState))
            .gesture(RotationGesture()
                        .onChanged({ (value) in
                            self.rotateState = value.degrees
                        }))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
