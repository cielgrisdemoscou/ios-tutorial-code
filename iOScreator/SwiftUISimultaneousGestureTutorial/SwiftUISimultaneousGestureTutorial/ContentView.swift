//
//  ContentView.swift
//  SwiftUISimultaneousGestureTutorial
//
//  Created by Ted Hyeong on 13/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var degrees: Double = 0
    @State var scale: CGFloat = 1.0
    
    var body: some View {
        
        let magnificationGesture = MagnificationGesture().onChanged { (value) in
            self.scale = value.magnitude
        }
        
        let rotationGesture = RotationGesture().onChanged { (value) in
            self.degrees = value.degrees
        }
        
        let magnificationAndRotateGesture = magnificationGesture.simultaneously(with: rotationGesture)
        
        VStack {
            Image(systemName: "star.circle.fill")
                .font(.system(size: 200))
                .foregroundColor(Color.red)
                .gesture(magnificationAndRotateGesture)
                .rotationEffect(Angle(degrees: degrees))
                .scaleEffect(scale)
                .animation(.easeInOut)
            
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
