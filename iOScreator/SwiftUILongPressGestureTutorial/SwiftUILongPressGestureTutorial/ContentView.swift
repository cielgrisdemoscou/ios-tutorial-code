//
//  ContentView.swift
//  SwiftUILongPressGestureTutorial
//
//  Created by Ted Hyeong on 09/01/2021.
//

import SwiftUI

struct ContentView: View {
    // 1.
    @State var circleColor = Color.yellow
    
    var body: some View {
        
        // 2.
        Circle()
        .foregroundColor(circleColor)
        .frame(width: 200, height: 200, alignment: .center)
        // 3.
        .gesture(LongPressGesture(minimumDuration: 2)
        .onEnded { _ in
            if self.circleColor == .yellow {
                self.circleColor = .red
            } else {
                self.circleColor = .yellow
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
