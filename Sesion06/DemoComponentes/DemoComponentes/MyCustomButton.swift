//
//  MyCustomButton.swift
//  DemoComponentes
//
//  Created by Kenyi Rodriguez on 20/05/21.
//

import UIKit

@IBDesignable class MyCustomButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("awakeFromNib")
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        print("prepareForInterfaceBuilder")
    }
    
    override func setNeedsLayout() {
        super.setNeedsLayout()
        self.backgroundColor = .black
        print("setNeedsLayout")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("layoutSubviews")
    }
    
    //Warning: Esto se puede ejecutar varias veces (ten cuidado en su uso)
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        print("draw")
        self.setStyle()
    }
    
    func setStyle() {
        
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.systemIndigo.cgColor
        self.layer.cornerRadius = 0
        
        self.layer.shadowColor = UIColor.cyan.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.6
        
        self.setTitleColor(UIColor.systemIndigo, for: .normal)
    }
    
}
