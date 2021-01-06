//
//  ContentView.swift
//  SwiftUIPreviewDevicesTutorial
//
//  Created by Ted Hyeong on 06/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Multiple Devices")
                .font(.largeTitle)
            Circle()
                .foregroundColor(Color.blue)
                .padding(.horizontal, 10)
            
            Text("Testing Preview")
                .font(.title)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .previewDisplayName("iPhone SE")
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                .previewDisplayName("iPhone 11")
        }
    }
}
