//
//  DestinoViewController.swift
//  Navegacion
//
//  Created by Kenyi Rodriguez on 29/04/21.
//

import UIKit

class DestinoViewController: UIViewController {

    @IBAction func clickBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
