//
//  DetailMovieViewController.swift
//  ConsumoServicio
//
//  Created by Kenyi Rodriguez on 1/07/21.
//

import UIKit
import Alamofire

class DetailMovieViewController: UIViewController {
    
    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var imgPosterMovie: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblOverView: UILabel!
    
    
    var objMovie: MovieBE!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadInformation()
    }
    
    func configureStyle() {
        
        self.imgPosterMovie.layer.cornerRadius = 10
        self.imgPosterMovie.layer.masksToBounds = true
    }
    
    private func loadInformation() {
        
        self.lblTitle.text = self.objMovie.title
        self.lblOverView.text = self.objMovie.overview
        
        AF.request(self.objMovie.poster).responseData { responseData in
            
            guard let data = responseData.data else { return }
            self.imgMovie.image         = UIImage(data: data)
            self.imgPosterMovie.image   = self.imgMovie.image
            self.configureStyle()
        }
    }
}
