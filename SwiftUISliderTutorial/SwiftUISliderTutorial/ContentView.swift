//
//  ContentView.swift
//  SwiftUISliderTutorial
//
//  Created by Ted Hyeong on 03/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State var sliderValue = 0.0
    var minimumValue = 0.0
    var maximumValue = 100.0
    
    var body: some View {
        VStack {
            HStack {
                Text("\(Int(minimumValue))")
                
                Slider(value: $sliderValue, in: minimumValue...maximumValue)
                Text("\(Int(maximumValue))")
            }.padding()
            Text("\(Int(sliderValue))")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
