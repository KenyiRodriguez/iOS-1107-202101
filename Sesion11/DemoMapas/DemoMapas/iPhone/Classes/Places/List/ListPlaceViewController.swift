//
//  ListPlaceViewController.swift
//  DemoMapas
//
//  Created by Kenyi Rodriguez on 14/06/21.
//

import UIKit
import CoreLocation

class ListPlaceViewController: UIViewController {
    
    @IBOutlet weak var tlbPlaces: UITableView!
    
    var arrayPlaces = [PlaceBE]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayPlaces.append(PlaceBE(direccion: "Av. Alfredo Benavides 778, Cercado de Lima 15074",
                                   distrito: "Miraflores",
                                   coordinate: CLLocationCoordinate2D(latitude: -12.125431214072368, longitude: -77.0248591001233)))
        
        arrayPlaces.append(PlaceBE(direccion: "Av. Faustino Sánchez Carrión 285, San Isidro 15076",
                                   distrito: "San Isidro",
                                   coordinate: CLLocationCoordinate2D(latitude: -12.093836452260742, longitude: -77.05300107053482)))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let controller = segue.destination as? PlaceDetailViewController, let objPlace = sender as? PlaceBE {
            controller.objPlace = objPlace
            
        } else if let controller = segue.destination as? AddNewPlaceViewController {
            controller.delegate = self
        }
    }
}

extension ListPlaceViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrayPlaces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceTableViewCell", for: indexPath) as? PlaceTableViewCell
        cell?.objPlace = self.arrayPlaces[indexPath.row]
        
        return cell ?? UITableViewCell()
    }
}

extension ListPlaceViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let objPlace = self.arrayPlaces[indexPath.row]
        self.performSegue(withIdentifier: "PlaceDetailViewController", sender: objPlace)
    }
}

extension ListPlaceViewController: AddNewPlaceViewControllerDelegate {
    
    func newPlaceController(_ controller: AddNewPlaceViewController, addNewPlace objPlace: PlaceBE) {
        
        self.arrayPlaces.append(objPlace)
        self.tlbPlaces.reloadData()
    }
}
