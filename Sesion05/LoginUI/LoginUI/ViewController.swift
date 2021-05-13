//
//  ViewController.swift
//  LoginUI
//
//  Created by Kenyi Rodriguez on 13/05/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewContent      : UIView!
    @IBOutlet weak var cnsCenterYContent: NSLayoutConstraint!
    
    
    @IBAction func tapToCloseKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerKeyboardNotification()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
            self.unregisterKeyboardNotification()
    }
}

/*
 Keyboard will show
 Keyboard did show
 
 Keyboard will hide
 Keyboard did hide
 */

extension ViewController {
    
    func registerKeyboardNotification() {
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    func unregisterKeyboardNotification() {
        
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
    
        let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        
        let finalPosyContent = self.viewContent.frame.origin.y + self.viewContent.frame.size.height
        
        if keyboardFrame.origin.y < finalPosyContent {
            
            UIView.animate(withDuration: duration) {
                self.cnsCenterYContent.constant = keyboardFrame.origin.y - finalPosyContent
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        
        let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        UIView.animate(withDuration: duration) {
            self.cnsCenterYContent.constant = 0
            self.view.layoutIfNeeded()
        }
    }
}
