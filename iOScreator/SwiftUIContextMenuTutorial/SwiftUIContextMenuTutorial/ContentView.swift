//
//  ContentView.swift
//  SwiftUIContextMenuTutorial
//
//  Created by Ted Hyeong on 09/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Text("Action")
                .font(.title)
                
                .contextMenu {
                    
                    Button(action: {}) {
                        Text("Share")
                        Image(systemName: "square.and.arrow.up")
                    }

                    Button(action: {}) {
                        Image(systemName: "heart.fill")
                        Text("Favorite")
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
