//
//  ContentView.swift
//  SwiftUIStateTutorial
//
//  Created by Ted Hyeong on 02/01/2021.
//

import SwiftUI

struct ContentView : View {
    @State var userIsLoggedIn = false
    
    var body: some View {
        VStack {
            Toggle(isOn: $userIsLoggedIn) {
                Text("Log in")
            }.padding()
            
            if (userIsLoggedIn) {
                Text("user is logged in")
            } else {
                Text("user is logged out")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}
