//
//  PlaceTableViewCell.swift
//  DemoMapas
//
//  Created by Kenyi Rodriguez on 14/06/21.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var lblDistrict  : UILabel!
    @IBOutlet weak private var lblAddres    : UILabel!
     
    var objPlace: PlaceBE! {
        didSet { self.updateData() }
    }
    
    private func updateData() {
        self.lblDistrict.text   = self.objPlace.district
        self.lblAddres.text     = self.objPlace.address
    }
}
