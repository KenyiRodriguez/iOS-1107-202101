//
//  ViewController.swift
//  DemoDelegados
//
//  Created by Kenyi Rodriguez on 1/07/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

extension ViewController: BoxViewDelegate {
    
    func boxViewTap(_ boxView: BoxView) {
        
        boxView.changeToRadmonColor()
        
        UIView.animate(withDuration: 0.5) {
            
            let posx = CGFloat.random(in: 0...self.view.frame.width)
            let posy = CGFloat.random(in: 0...self.view.frame.height)
            boxView.center = CGPoint(x: posx, y: posy)
        }
    }
}


