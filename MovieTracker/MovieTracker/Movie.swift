//
//  Movie.swift
//  MovieTracker
//
//  Created by Faraz Haider on 15/06/2020.
//  Copyright © 2020 Etisalat. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct Movie : Identifiable{
    var id: UUID = UUID()
    var title : String  = "Bambi"
    var rating = 3.0
    var seen:Bool = false
}

class MovieStore: ObservableObject {
    let didChange = PassthroughSubject<Void,Never>()
    
    var movies: [Movie] = [] {
        didSet{
            didChange.send()
        }
    }
    
    init() {
        var movie1 = Movie()
        movie1.title = "Sandlot"
        
        var movie2 = Movie()
        movie2.title = "The Matrix"
        movie2.seen = true
        
        movies = [movie1,movie2]
    }
    
    func addMovie(movie : Movie){
        movies.append(movie)
    }
}
