//
//  ContentView.swift
//  SwiftUIDarkModePreviewTutorial
//
//  Created by Ted Hyeong on 06/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Text("Dark mode Preview")
        }.environment(\.colorScheme, .dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
