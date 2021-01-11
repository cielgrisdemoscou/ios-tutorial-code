//
//  ContentView.swift
//  SwiftUILinkTutorial
//
//  Created by Ted Hyeong on 11/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Link("Read more", destination: URL(string: "https://www.ioscreator.com")!)
            Spacer()
        }
        .padding(.all, 10)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
