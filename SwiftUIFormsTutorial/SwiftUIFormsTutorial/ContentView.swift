//
//  ContentView.swift
//  SwiftUIFormsTutorial
//
//  Created by Ted Hyeong on 06/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var enableAirplaneMode = false
    
    var notificationMode = ["Lock Screen", "Notification Center", "Banners"]
    @State private var selectedMode = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("General Settings")) {
                    Toggle(isOn: $enableAirplaneMode) {
                        Text("Airplane Mode")
                    }
                    
                    Picker(selection: $selectedMode, label: Text("Notifications")) {
                        ForEach(0..<notificationMode.count) {
                            Text(self.notificationMode[$0])
                        }
                    }
                }
                Section(header: Text("About")) {
                    HStack {
                        Text("Name")
                        Spacer()
                        Text("iPhone11")
                    }
                    
                    HStack {
                        Text("Software Version")
                        Spacer()
                        Text("13.1.1")
                    }
                }
            } .navigationBarTitle("Settings")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
