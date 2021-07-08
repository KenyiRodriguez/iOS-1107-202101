//
//  MovieCollectionViewCell.swift
//  ConsumoServicio
//
//  Created by Kenyi Rodriguez on 24/06/21.
//

import UIKit
import Alamofire

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak private var imgMovie: UIImageView!
    @IBOutlet weak private var lblTitle: UILabel!
    
    var objMovie: MovieBE! {
        didSet { self.updateData() }
    }
    
    private func updateData() {
        
        self.lblTitle.text = self.objMovie.title
        
        AF.request(self.objMovie.poster).response { responseData in
            
            guard let data = responseData.data else { return }
            let image = UIImage(data: data)
            self.imgMovie.image = image
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.contentView.layer.cornerRadius = 10
        
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.4
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = .zero
        self.layer.masksToBounds = false
    }
}
