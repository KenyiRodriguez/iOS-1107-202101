//
//  InforMarker.swift
//  DemoMapas
//
//  Created by Kenyi Rodriguez on 3/06/21.
//

import UIKit

class InfoMarker: UIView {
    
    lazy var lblContenido: UILabel = {
        let lblContenido = UILabel()
        lblContenido.backgroundColor = .clear
        lblContenido.translatesAutoresizingMaskIntoConstraints = false
        lblContenido.numberOfLines = 0
        return lblContenido
    }()
    
    override func draw(_ rect: CGRect) {
        self.addSubview(self.lblContenido)
        
        self.lblContenido.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        self.lblContenido.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 5).isActive = true
        self.lblContenido.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        self.lblContenido.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 5).isActive = true
    }
    
    class func create(_ place: PlaceBE) -> InfoMarker {
        
        let view = InfoMarker()
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 80)
        view.backgroundColor = .white
//        view.layer.borderColor = UIColor.black.cgColor
//        view.layer.borderWidth = 2
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = .zero
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 5
        view.superview?.layer.masksToBounds = false
        
        view.lblContenido.text = "Dirección: \(place.address)\nDistrito: \(place.district)"
        return view
    }
}
