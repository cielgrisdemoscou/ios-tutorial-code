//
//  ContentView.swift
//  SwiftUIBasicShapesTutorial
//
//  Created by Ted Hyeong on 05/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Rectangle()
                .stroke(Color.blue, lineWidth: 10)
                .frame(width: 100, height: 100)
            Circle()
                .fill(Color.red)
                .frame(width: 100, height: 100)
            Capsule()
                .fill(Color.green)
                .overlay(
                Capsule()
                    .stroke(Color.black, lineWidth: 10))
                .frame(width: 200, height: 100)
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.yellow)
                .frame(width: 100, height: 100)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
