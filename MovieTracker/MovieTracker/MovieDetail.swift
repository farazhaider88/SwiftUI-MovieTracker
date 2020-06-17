//
//  MovieDetail.swift
//  MovieTracker
//
//  Created by Faraz Haider on 14/06/2020.
//  Copyright © 2020 Etisalat. All rights reserved.
//

import SwiftUI

struct MovieDetail: View {
    
    @State var movie:Movie
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var movieStore : MovieStore
    var newMovie : Bool
    
    var body: some View {
        List {
            Section{
                VStack(alignment: .leading){
                    ControlTitle(title: "Title")
                    TextField("", text:$movie.title)
                }
            }
            Section{
                VStack(alignment: .leading){
                    ControlTitle(title: "Rating")
                    HStack {
                        Spacer()
                        Text(String(repeating: "★", count: Int(movie.rating))).font(.title).foregroundColor(.yellow)
                        Spacer()
                    }
                    Slider(value: $movie.rating, in: 1...5, step: 0.5)
                }
            }
            Section{
                VStack(alignment: .leading){
                    ControlTitle(title: "Watched")
                    Toggle(isOn: $movie.seen) {
                        if movie.title == ""{
                            Text("I have seen this movie")
                        }else{
                            Text("I have seen \(movie.title)")
                        }
                        
                    }
                    
                }
            }
            
            if newMovie{
                Section{
                    HStack{
                       Spacer()
                        Button(action: {
                            self.movieStore.addMovie(movie: self.movie)
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Save")
                        }
                        Spacer()
                    }
                }
            }
            
        }.listStyle(GroupedListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: Movie(),movieStore: MovieStore(), newMovie: true)
    }
}

struct ControlTitle: View {
    var title:String = ""
    var body: some View {
        Text(title).font(.subheadline).foregroundColor(.gray)
    }
}
