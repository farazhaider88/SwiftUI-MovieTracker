//
//  MovieDetail.swift
//  MovieTracker
//
//  Created by Faraz Haider on 14/06/2020.
//  Copyright © 2020 Etisalat. All rights reserved.
//

import SwiftUI

struct MovieDetail: View {
    
    @State var title = ""
    @State var rating = 3.0
    @State var seen = false
    
    var body: some View {
        List {
            Section{
                VStack(alignment: .leading){
                    ControlTitle(title: "Title")
                    TextField("", text:$title)
                }
            }
            Section{
                VStack(alignment: .leading){
                    ControlTitle(title: "Rating")
                    HStack {
                        Spacer()
                        Text(String(repeating: "★", count: Int(rating))).font(.title).foregroundColor(.yellow)
                        Spacer()
                    }
                    Slider(value: $rating, in: 1...5, step: 0.5)
                }
            }
            Section{
                VStack(alignment: .leading){
                    ControlTitle(title: "Watched")
                    Toggle(isOn: $seen) {
                        if title == ""{
                            Text("I have seen this movie")
                        }else{
                            Text("I have seen \(title)")
                        }
                        
                    }
                    
                }
            }
            
            Section{
                HStack{
                   Spacer()
                    Button(action: {
                        
                    }) {
                        Text("Save")
                    }
                    Spacer()
                }
            }
        }.listStyle(GroupedListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail()
    }
}

struct ControlTitle: View {
    var title:String = ""
    var body: some View {
        Text(title).font(.subheadline).foregroundColor(.gray)
    }
}
