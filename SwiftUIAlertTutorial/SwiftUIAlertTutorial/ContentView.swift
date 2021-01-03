//
//  ContentView.swift
//  SwiftUIAlertTutorial
//
//  Created by Ted Hyeong on 03/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    
    var alert: Alert {
        Alert(title: Text("iOScreator"), message: Text("Hello SwiftUI"), dismissButton: .default(Text("Dismiss")))
    }
    
    var body: some View {
        Button(action: {
            self.showAlert.toggle()
        }) {
            Text("Show Alert")
        }
        
        .alert(isPresented: $showAlert, content: {
            self.alert
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
