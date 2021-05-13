//
//  ViewController.swift
//  Constraints
//
//  Created by Kenyi Rodriguez on 6/05/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cnsAltura: NSLayoutConstraint!
    
    @IBAction func clickBtnCambiarAltura(_ sender: Any) {
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.8, options: [.curveEaseInOut]) {
            
            let nuevaAltura = CGFloat.random(in: 90...400)
            self.cnsAltura.constant = nuevaAltura
            self.view.layoutIfNeeded()
            
        } completion: { (_) in
            print("TERMINÓ")
        }

        
        
//        UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseOut, .autoreverse, .repeat]) {
//
//            let nuevaAltura = CGFloat.random(in: 90...400)
//            self.cnsAltura.constant = nuevaAltura
//            self.view.layoutIfNeeded()
//
//        } completion: { (_) in
//            print("TERMINÓ")
//        }

        
        
//        Básica con completion
//        UIView.animate(withDuration: 0.4) {
//
//            let nuevaAltura = CGFloat.random(in: 90...400)
//            self.cnsAltura.constant = nuevaAltura
//
//            self.view.layoutIfNeeded()
//
//        } completion: { (isCorrect) in
//
//            print("TERMINÓ")
//        }

        
        
//        Animación básica
//        UIView.animate(withDuration: 0.4) {
//
//            let nuevaAltura = CGFloat.random(in: 90...400)
//            self.cnsAltura.constant = nuevaAltura
//
//            self.view.layoutIfNeeded()
//        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

