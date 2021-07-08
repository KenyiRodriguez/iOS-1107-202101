//
//  BoxView.swift
//  DemoDelegados
//
//  Created by Kenyi Rodriguez on 1/07/21.
//

import UIKit

@objc protocol BoxViewDelegate: NSObjectProtocol {
    
    func boxViewTap(_ boxView: BoxView)
}

class BoxView: UIView {
    
    lazy var tapGesture: UITapGestureRecognizer = {
       
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.tapInView))
        return gesture
    }()
    
    @IBOutlet weak var delegate: BoxViewDelegate?
    
    @objc func tapInView() {
        
        self.delegate?.boxViewTap(self)
        print("LO TOCO!!!")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.addGestureRecognizer(self.tapGesture)
    }
    
    override func setNeedsLayout() {
        super.setNeedsLayout()
        self.changeToRadmonColor()
    }
    
    func changeToRadmonColor() {
        
        let r = CGFloat.random(in: 0...255) / 255.0
        let g = CGFloat.random(in: 0...255) / 255.0
        let b = CGFloat.random(in: 0...255) / 255.0
        
        let newColor = UIColor(displayP3Red: r, green: g, blue: b, alpha: 1)
        self.backgroundColor = newColor
    }
}
