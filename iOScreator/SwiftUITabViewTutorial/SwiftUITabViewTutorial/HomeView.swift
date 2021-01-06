//
//  HomeView.swift
//  SwiftUITabViewTutorial
//
//  Created by Ted Hyeong on 05/01/2021.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.red
                .edgesIgnoringSafeArea(.all)
            Text("Home View")
                .font(.largeTitle)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
