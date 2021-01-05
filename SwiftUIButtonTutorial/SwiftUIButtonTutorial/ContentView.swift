//
//  ContentView.swift
//  SwiftUIButtonTutorial
//
//  Created by Ted Hyeong on 05/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State var counter = 0
    
    var body: some View {
        VStack {
            Button(action: {
                self.counter += 1
            }, label: {
                HStack {
                    Image(systemName: "plus.circle")
                    Text("Add 1")
                }
            })
            .padding()
            .background(Color.blue)
            
            Text("\(counter)")
                .padding()
        }
        .foregroundColor(Color.black)
        .font(.title)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
