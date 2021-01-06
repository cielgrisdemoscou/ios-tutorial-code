//
//  ContentView.swift
//  SwiftUIStackTutorial
//
//  Created by Ted Hyeong on 02/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        /*
        VStack(spacing: 50) {
            Text("Hello, world!")
            Text("SwiftUI !!")
        }
        .font(.largeTitle)
 */
        HStack(spacing: 10) {
            Text("Mac")
            Text("iPad")
            Text("iPhone")
            Text("Watch")
        }
        .font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
