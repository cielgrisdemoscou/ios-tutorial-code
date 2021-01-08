//
//  ContentView.swift
//  SwiftUIGeometryReaderTutorial
//
//  Created by Ted Hyeong on 08/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            GeometryReader { geometry in
                VStack {
                    Text("One")
                        .frame(width: geometry.size.width, height: geometry.size.height/2)
                        .background(Color.red)
                    HStack {
                        Text("Two")
                            .frame(width: geometry.size.width/2, height: geometry.size.height/2)
                            .background(Color.blue)
                        Text("Three")
                            .frame(width: geometry.size.width/2, height: geometry.size.height/2)
                            .background(Color.yellow)
                    }
                }
            }
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
