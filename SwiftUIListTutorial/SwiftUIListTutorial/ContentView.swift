//
//  ContentView.swift
//  SwiftUIListTutorial
//
//  Created by Ted Hyeong on 02/01/2021.
//

import SwiftUI

struct Weather: Identifiable {
    var id = UUID()
    var image: String
    var temp: Int
    var city: String
}

struct ContentView: View {
    var body: some View {
        let modelData: [Weather] = [
            Weather(image: "cloud.rain", temp: 21, city: "Amsterdam"),
            Weather(image: "cloud.sun.rain", temp: 18, city: "London"),
            Weather(image: "sun.max", temp: 25, city: "Paris"),
            Weather(image: "cloud.sun", temp: 23, city: "Tokyo")]
        
        NavigationView() {
            List(modelData) { weather in
                NavigationLink(
                    destination: Text(weather.city).font(.largeTitle)) {
                    HStack {
                        Image(systemName: weather.image)
                            .frame(width: 50, height: 10, alignment: .leading)
                        Text("\(weather.temp)")
                            .frame(width: 50, height: 10, alignment: .leading)
                        VStack {
                            Text(weather.city)
                        }
                    }.font(.title)
                }
            }
            .navigationTitle(Text("World Weather"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
            .previewDisplayName("iPhone XS Max")
    }
}
