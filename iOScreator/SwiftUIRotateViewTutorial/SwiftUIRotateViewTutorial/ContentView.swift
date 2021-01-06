//
//  ContentView.swift
//  SwiftUIRotateViewTutorial
//
//  Created by Ted Hyeong on 04/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State var rotation: Double = 0.0
    
    var body: some View {
        VStack {
            Slider(value: $rotation, in: 0.0 ... 360.0, step: 1.0)
                .padding()
            Image(systemName: "sun.max")
                .rotationEffect((.degrees(rotation)))
        }.font(.title)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
