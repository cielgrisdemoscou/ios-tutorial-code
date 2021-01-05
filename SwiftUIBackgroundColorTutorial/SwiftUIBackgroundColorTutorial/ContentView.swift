//
//  ContentView.swift
//  SwiftUIBackgroundColorTutorial
//
//  Created by Ted Hyeong on 05/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.red
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
