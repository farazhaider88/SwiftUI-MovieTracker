//
//  ContentView.swift
//  MovieTracker
//
//  Created by Faraz Haider on 14/06/2020.
//  Copyright © 2020 Etisalat. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var title = ""
    @State var rating = 3.0
    @State var seen = false
    
    var body: some View {
        List {
            Section{
                VStack(alignment: .leading){
                    Text("Title").font(.subheadline).foregroundColor(.gray)
                    TextField("", text:$title)
                }
            }
            Section{
                VStack(alignment: .leading){
                    Text("Rating").font(.subheadline).foregroundColor(.gray)
                    HStack {
                        Spacer()
                        Text(String(repeating: "★", count: Int(rating))).font(.title).foregroundColor(.yellow)
                        Spacer()
                    }
                    Slider(value: $rating, in: 1...5, step: 0.5)
                }
            }
        }.listStyle(GroupedListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
