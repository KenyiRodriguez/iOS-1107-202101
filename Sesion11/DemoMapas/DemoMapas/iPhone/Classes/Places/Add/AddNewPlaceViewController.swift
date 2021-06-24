//
//  AddNewPlaceViewController.swift
//  DemoMapas
//
//  Created by Kenyi Rodriguez on 17/06/21.
//

import UIKit
import GoogleMaps

protocol AddNewPlaceViewControllerDelegate {
    func newPlaceController(_ controller: AddNewPlaceViewController, addNewPlace objPlace: PlaceBE)
}

class AddNewPlaceViewController: UIViewController {
    
    @IBOutlet weak private var txtDistrict  : UITextField!
    @IBOutlet weak private var txtAddress   : UITextField!
    @IBOutlet weak private var mapView      : GMSMapView!
    
    var delegate: AddNewPlaceViewControllerDelegate?
    private var coordinateSelected: CLLocationCoordinate2D?
    
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
        self.setupMapView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let userCoordinate = self.locationManager.location?.coordinate {
            self.moveCameraToCoordinate(userCoordinate, zoom: 17)
        }
    }
    
    @IBAction private func tapToCloseKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBAction private func clickBtnSave(_ sender: Any) {
        
        guard let district = self.txtDistrict.text, district.count != 0 else {
            self.showAutomaticAlert(title: "Error", message: "Ingresa un distrito")
            return
        }
        
        guard let address = self.txtAddress.text, address.count != 0 else {
            self.showAutomaticAlert(title: "Error", message: "Ingresa una dirección")
            return
        }
        
        guard let coordinate = self.coordinateSelected else {
            self.showAutomaticAlert(title: "Error", message: "Ingresa una coordenada")
            return
        }
        
        let objPlace = PlaceBE(direccion: address, distrito: district, coordinate: coordinate)
        //DESDE ACA TU DECIDES DONDE GUARDAS LAS DATA......
        
        self.delegate?.newPlaceController(self, addNewPlace: objPlace)
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setupGPS() {
        
        self.locationManager.startUpdatingLocation()
        self.mapView.settings.compassButton = true
        self.mapView.settings.myLocationButton = true
        self.mapView.isMyLocationEnabled = true
    }
    
    private func setupMapView() {
        
        self.mapView.layer.borderWidth = 1
        self.mapView.layer.borderColor = UIColor.lightGray.cgColor
        self.mapView.layer.cornerRadius = 8
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

extension AddNewPlaceViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        
        self.coordinateSelected = coordinate
        self.createMarkerToCoordinate(coordinate)
    }
}
