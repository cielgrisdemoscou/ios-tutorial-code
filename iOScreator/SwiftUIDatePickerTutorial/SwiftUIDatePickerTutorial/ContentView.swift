//
//  ContentView.swift
//  SwiftUIDatePickerTutorial
//
//  Created by Ted Hyeong on 06/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack {
            Text("Select a future date")
                .font(.largeTitle)
            
            DatePicker(selection: $selectedDate, in: Date()..., displayedComponents: .date) {
                Text("")
            }.padding(30)
            
            Text("Selected Date is \(selectedDate, formatter: dateFormatter)")
                .font(.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
