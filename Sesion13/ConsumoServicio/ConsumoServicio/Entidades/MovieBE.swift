//
//  MovieBE.swift
//  ConsumoServicio
//
//  Created by Kenyi Rodriguez on 24/06/21.
//

import Foundation

class MovieBE {
    
    let title   : String
    let overview: String
    let poster  : String
    let average : Double
    
    init(json: [String: Any]) {
        
        let urlImage = "https://image.tmdb.org/t/p/w500"
        
        self.title      = json["original_title"] as? String ?? ""
        self.overview   = json["overview"] as? String ?? ""
        self.poster     = urlImage + (json["poster_path"] as? String ?? "")
        self.average    = json["vote_average"] as? Double ?? 0
    }
}
