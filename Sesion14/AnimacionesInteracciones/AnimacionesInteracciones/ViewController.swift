//
//  ViewController.swift
//  AnimacionesInteracciones
//
//  Created by Kenyi Rodriguez on 8/07/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewContent: UIView!
    
    @IBAction func clickBtnCreateBox(_ sender: Any) {
        
        let box = BoxView()
        box.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        self.viewContent.addSubview(box)
        
        box.changeCenterPosition()
        box.changeColor()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

