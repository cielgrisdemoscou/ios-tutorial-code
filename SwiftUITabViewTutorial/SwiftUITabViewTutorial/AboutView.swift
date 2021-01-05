//
//  AboutView.swift
//  SwiftUITabViewTutorial
//
//  Created by Ted Hyeong on 05/01/2021.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ZStack {
            Color.blue
                .edgesIgnoringSafeArea(.all)
            Text("About View")
                .font(.largeTitle)
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
