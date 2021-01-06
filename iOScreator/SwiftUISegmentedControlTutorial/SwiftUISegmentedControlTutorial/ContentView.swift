//
//  ContentView.swift
//  SwiftUISegmentedControlTutorial
//
//  Created by Ted Hyeong on 03/01/2021.
//

import SwiftUI

struct ContentView : View {
    @State private var selectorIndex = 0
    @State private var numbers = ["One","Two","Three"]
  
    var body: some View {
        VStack {
            Picker("Numbers", selection: $selectorIndex) {
                ForEach(0 ..< numbers.count) { index in
                    Text(self.numbers[index]).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
          
            Text("Selected value is: \(numbers[selectorIndex])").padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
