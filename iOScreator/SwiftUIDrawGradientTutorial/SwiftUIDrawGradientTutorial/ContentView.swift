//
//  ContentView.swift
//  SwiftUIDrawGradientTutorial
//
//  Created by Ted Hyeong on 07/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let gradientColors = Gradient(colors: [.red, .blue])
        
        return Rectangle()
            .foregroundColor(.clear)
            .background(LinearGradient(gradient: gradientColors, startPoint: .leading, endPoint: .trailing))
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
