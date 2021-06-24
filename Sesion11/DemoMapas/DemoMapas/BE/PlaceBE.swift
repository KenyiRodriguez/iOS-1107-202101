//
//  PlaceBE.swift
//  DemoMapas
//
//  Created by Kenyi Rodriguez on 3/06/21.
//

import Foundation
import CoreLocation

class PlaceBE {
    
    let address: String
    let district: String
    let coordinate: CLLocationCoordinate2D
    
    init(direccion: String, distrito: String, coordinate: CLLocationCoordinate2D) {
        self.district = distrito
        self.address = direccion
        self.coordinate = coordinate
    }
}
