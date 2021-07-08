//
//  ProductDetailViewController.swift
//  Navegaciones
//
//  Created by Kenyi Rodriguez on 8/07/21.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    @IBAction func clickBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
