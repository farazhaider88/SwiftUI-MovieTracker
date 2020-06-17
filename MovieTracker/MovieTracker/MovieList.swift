//
//  MovieList.swift
//  MovieTracker
//
//  Created by Faraz Haider on 15/06/2020.
//  Copyright © 2020 Etisalat. All rights reserved.
//

import SwiftUI

struct MovieList: View {
    @State var showingDetail = false
    @ObservedObject var movieStore = MovieStore()
    
    var body: some View {
        NavigationView{
            List{
                Button(action: {
                    self.showingDetail.toggle()
                }) {
                    Text("Add Movie").foregroundColor(.blue)
                }.sheet(isPresented: $showingDetail) {
                    MovieDetail(movie: Movie(),movieStore: self.movieStore, newMovie: true)
                }
                
                
                ForEach(movieStore.movies){ movie in
                    NavigationLink(destination: MovieDetail(movie: movie,movieStore: self.movieStore, newMovie: false)) {
                        if movie.seen{
                            Text(movie.title).foregroundColor(.green)
                        }else{
                            Text(movie.title)
                        }
                        
                    }
                }
            }
        }
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList()
    }
}
