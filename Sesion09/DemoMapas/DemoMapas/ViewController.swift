//
//  ViewController.swift
//  DemoMapas
//
//  Created by Kenyi Rodriguez on 3/06/21.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
        
    lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.requestWhenInUseAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        manager.distanceFilter = 100
        return manager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        self.locationManager.startUpdatingLocation()
        self.mapView.settings.compassButton = true
        self.mapView.settings.myLocationButton = true
        self.mapView.isMyLocationEnabled = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let coordinate = self.mapView.myLocation?.coordinate {
            self.moveCameraToCoordinate(coordinate, zoom: 17)
        }
    }
    
    func createMarkerToCoordinate(_ coordinate: CLLocationCoordinate2D, userData: Any) {
        
        let marker = GMSMarker(position: coordinate)
        marker.icon = UIImage(named: "pin")
        marker.userData = userData
        marker.map = self.mapView
    }
    
    func moveCameraToCoordinate(_ coordinate: CLLocationCoordinate2D, zoom: Float) {
        
        let camera = GMSCameraPosition(target: coordinate, zoom: 17)
        self.mapView.animate(to: camera)
    }
}

extension ViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        
        let lugar = PlaceBE(direccion: "Calle los olvidados 666", distrito: "Ni dios se acuerda")
        self.createMarkerToCoordinate(coordinate, userData: lugar)
    }
    
//    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
////        marker.map = nil
//
//        if let lugar = marker.userData as? PlaceBE {
//
//            print("\n******************************")
//            print("Direccion: \(lugar.direccion)")
//            print("Distrito: \(lugar.distrito)")
//        }
//
//        return true
//    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        self.moveCameraToCoordinate(coordinate, zoom: 19)
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {

        guard let place = marker.userData as? PlaceBE else { return nil }
        let view = InfoMarker.create(place)
        return view
    }
}
