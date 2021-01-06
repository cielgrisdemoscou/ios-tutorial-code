//
//  ContentView.swift
//  SwiftUIActionSheetTutorial
//
//  Created by Ted Hyeong on 04/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State var showActionSheet: Bool = false
    
    var actionSheet: ActionSheet {
        ActionSheet(title: Text("Action Sheet"), message: Text("Choose Option"), buttons: [
                        .default(Text("Save")),
                        .default(Text("Delete")),
                        .default((Text("Cancel")))
        ])
    }
    
    var body: some View {
        Button(action: {
            self.showActionSheet.toggle()
        }, label: {
            Text("Display Action Sheet")
        })
        .actionSheet(isPresented: $showActionSheet, content: {
            self.actionSheet
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
