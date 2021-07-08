//
//  WebServiceManager.swift
//  ConsumoServicio
//
//  Created by Kenyi Rodriguez on 24/06/21.
//

import Foundation

extension WebServiceManager {
    
    enum HTTPMethod: String {
        case get    = "GET"
        case post   = "POST"
        case put    = "PUT"
        case delete = "DELETE"
        case patch  = "PATCH"
    }
}

class WebServiceManager {
    
    typealias ServiceHandler = (_ response: Any?) -> Void
    
    func doRequestMethod(_ httpMethod: HTTPMethod, urlString: String, completionHandler: @escaping ServiceHandler) {
        
        guard let url = URL(string: urlString) else {
            print("La url no tiene un formato válido")
            completionHandler(nil)
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.httpAdditionalHeaders = ["Content-Type" : "application/json"]
        sessionConfiguration.timeoutIntervalForRequest = 30
        
        let session = URLSession(configuration: sessionConfiguration)
        
        let dataTask = session.dataTask(with: urlRequest) { data, urlResponse, error in
            
            do {
                
                guard let data = data else {
                    print("El servicio no responde")
                    completionHandler(nil)
                    return
                }
                
                let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                
                DispatchQueue.main.async {
                    //ACA ES DONDE DEBES CONVERTIR LA DATA PARA MOSTRAR EN UI
                    print(response)
                    completionHandler(response)
                }
                
            } catch {
                print("Ocurrio un error en la lectura de la trama")
                completionHandler(nil)
            }
        }
        
        dataTask.resume()
    }
}
