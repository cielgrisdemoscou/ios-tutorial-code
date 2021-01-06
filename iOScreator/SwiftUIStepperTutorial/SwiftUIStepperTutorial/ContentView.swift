//
//  ContentView.swift
//  SwiftUIStepperTutorial
//
//  Created by Ted Hyeong on 04/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State var numberOfItems: Int = 0
    
    var body: some View {
        Stepper(value: $numberOfItems, in: 0...10) {
            Text("Number of items: \(numberOfItems)")
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
