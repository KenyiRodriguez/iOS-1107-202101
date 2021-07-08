//
//  MovieWS.swift
//  ConsumoServicio
//
//  Created by Kenyi Rodriguez on 24/06/21.
//

import Foundation
import Alamofire

typealias JSON = [String: Any]

class MovieWS {
    
    typealias ArrayMovies = (_ arrayMovies: [MovieBE]) -> Void
    
    func getAllMoviesNative(_ completionHandler: @escaping ArrayMovies) {
        
        let urlString = "https://api.themoviedb.org/4/list/1?api_key=752cd23fdb3336557bf3d8724e115570&page=1"

        WebServiceManager().doRequestMethod(.get, urlString: urlString) { jsonResponse in
            print("TERMINO DE CONSUMIR")
            let json = jsonResponse as? JSON ?? [:]
            let arrayMovies = self.convertJSONToMovies(json)
            completionHandler(arrayMovies)
        }
    }
    
    func getAllMoviesAF(_ completionHandler: @escaping ArrayMovies) {
        
        let urlString = "https://api.themoviedb.org/4/list/1?api_key=752cd23fdb3336557bf3d8724e115570&page=1"

        AF.request(urlString).response { dataResponse in
            
            guard let data = dataResponse.data else { return }
            let response = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
            print(response ?? "El servicio no responde")
            
            let json = response as? JSON ?? [:]
            let arrayMovies = self.convertJSONToMovies(json)
            completionHandler(arrayMovies)
        }
    }
    
    private func convertJSONToMovies(_ json: JSON) -> [MovieBE] {
        
        var arrayMovies = [MovieBE]()
        let results = json["results"] as? [JSON] ?? []
        
        for movieJSON in results {
            arrayMovies.append(MovieBE(json: movieJSON))
        }
        
        return arrayMovies
    }
}
