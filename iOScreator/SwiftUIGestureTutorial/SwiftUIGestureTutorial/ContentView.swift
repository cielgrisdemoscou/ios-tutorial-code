//
//  ContentView.swift
//  SwiftUIGestureTutorial
//
//  Created by Ted Hyeong on 04/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var didTap: Bool = false
    
    var body: some View {
        Text("Tap me")
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .gesture(TapGesture()
                        .onEnded{
                            self.didTap.toggle()
                        })
            .background(didTap ? Color.blue : Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
