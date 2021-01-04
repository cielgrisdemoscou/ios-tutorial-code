//
//  ContentView.swift
//  SwiftUIScaleImageTutorial
//
//  Created by Ted Hyeong on 04/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State var scale: CGFloat = 1.0
    
    var body: some View {
        VStack {
            Slider(value: $scale, in: 1.0 ... 10.0, step: 0.1)
                .padding(.bottom, 100)
            
            Image(systemName: "cloud.rain")
                .scaleEffect(scale)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
