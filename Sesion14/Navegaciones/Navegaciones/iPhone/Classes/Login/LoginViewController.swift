//
//  LoginViewController.swift
//  Navegaciones
//
//  Created by Kenyi Rodriguez on 8/07/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBAction func clickBtnLogin(_ sender: Any) {
        self.performSegue(withIdentifier: "goToApp", sender: nil)
    }
}
