//
//  ContentView.swift
//  SwiftUISecureTextFieldTutorial
//
//  Created by Ted Hyeong on 07/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var password: String = ""
    
    var body: some View {
        Form {
            Section(header: Text("Authentication")) {
                SecureField("Enter a Passord", text: $password)
                Text("You entered \(password)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
