//
//  ContentView.swift
//  SwiftUIDividerTutorial
//
//  Created by Ted Hyeong on 09/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            Group {
                Text("Horizontal Divider")
                Divider()
                Image(systemName: "1.circle")
                Divider()
            }
            
            Group {
                Text("Veritical Divider")
                HStack {
                    Divider()
                    Image(systemName: "2.circle")
                    Divider()
                }.frame(height: 100)
                Group {
                    Text("Change Divider Color")
                    Image(systemName: "3.circle")
                    Divider().background(Color.red)
                    
                    Text("Change Divider Size")
                    Image(systemName: "4.circle")
                    Divider().frame(width: 200)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
