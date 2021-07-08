//
//  ProfileViewController.swift
//  Navegaciones
//
//  Created by Kenyi Rodriguez on 8/07/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBAction func clickBtnCloseSession(_ sender: Any) {
        
        guard let controller = self.navigationController?.viewControllers.first(where: { $0 is LoginViewController }) else { return }
        self.navigationController?.popToViewController(controller, animated: true)
    }
}
