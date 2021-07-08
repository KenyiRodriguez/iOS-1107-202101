//
//  BoxView.swift
//  AnimacionesInteracciones
//
//  Created by Kenyi Rodriguez on 8/07/21.
//

import UIKit

class BoxView: UIView {
    
    lazy var tapGesture: UITapGestureRecognizer = {
       
        let gesture = UITapGestureRecognizer()
        gesture.addTarget(self, action: #selector(self.tapGestureInView(_:)))
        return gesture
    }()
    
    override func draw(_ rect: CGRect) {
        self.addGestureRecognizer(self.tapGesture)
    }
    
    @objc func tapGestureInView(_ gesture: Any) {
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.4, options: .curveEaseOut) {
            
            self.changeColor()
            self.changeCenterPosition()
            self.rotate()

        } completion: { _ in
            
            self.restoreRotate()
        }
    }
    
    func rotate() {
        self.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
    }
    
    func restoreRotate() {
        self.transform = .identity
    }
    
    func changeCenterPosition() {
        
        let superViewSize = self.superview?.frame.size ?? .zero
        let posx = CGFloat.random(in: 0...superViewSize.width)
        let posy = CGFloat.random(in: 0...superViewSize.height)
        
        let newCenter = CGPoint(x: posx, y: posy)
        self.center = newCenter
    }
    
    func changeColor() {
        
        let r = CGFloat.random(in: 0...255) / 255
        let g = CGFloat.random(in: 0...255) / 255
        let b = CGFloat.random(in: 0...255) / 255
        
        let newColor = UIColor(displayP3Red: r, green: g, blue: b, alpha: 1)
        self.backgroundColor = newColor
    }
}
