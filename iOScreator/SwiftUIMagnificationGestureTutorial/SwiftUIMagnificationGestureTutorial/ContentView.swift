//
//  ContentView.swift
//  SwiftUIMagnificationGestureTutorial
//
//  Created by Ted Hyeong on 07/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State var scale: CGFloat = 1.0
    
    var body: some View {
        Image("Apple_Swift_Logo")
            .resizable()
            .scaleEffect(scale)
            .frame(width: 100, height: 100)
        
            .gesture(MagnificationGesture()
                        .onChanged({ (value) in
                            self.scale = value.magnitude
                        }))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
