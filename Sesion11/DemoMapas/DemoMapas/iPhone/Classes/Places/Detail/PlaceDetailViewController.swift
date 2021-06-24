//
//  ViewController.swift
//  DemoMapas
//
//  Created by Kenyi Rodriguez on 3/06/21.
//

import UIKit
import GoogleMaps

class PlaceDetailViewController: UIViewController {

    @IBOutlet weak private var mapView: GMSMapView!
        
    var objPlace: PlaceBE!
    
    lazy private var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.requestWhenInUseAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        manager.distanceFilter = 100
        return manager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupGPS()
        self.setPlaceInformation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setPlaceInformation() {
        
        self.createMarkerToCoordinate(self.objPlace.coordinate)
        self.moveCameraToCoordinate(self.objPlace.coordinate, zoom: 17)
    }
    
    private func setupGPS() {
        
        self.locationManager.startUpdatingLocation()
        self.mapView.settings.compassButton = true
        self.mapView.settings.myLocationButton = true
        self.mapView.isMyLocationEnabled = true
    }
    
    private func createMarkerToCoordinate(_ coordinate: CLLocationCoordinate2D) {
        
        let marker = GMSMarker(position: coordinate)
        marker.icon = UIImage(named: "pin")
        marker.map = self.mapView
    }
    
    private func moveCameraToCoordinate(_ coordinate: CLLocationCoordinate2D, zoom: Float) {
        
        let camera = GMSCameraPosition(target: coordinate, zoom: zoom)
        self.mapView.animate(to: camera)
    }
}
