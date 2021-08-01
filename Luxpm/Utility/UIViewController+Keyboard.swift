//
//  UIViewController+Keyboard.swift
//  Luxpm
//
//  Created by Anuj Vats on 01/08/21.
//

import UIKit

extension UIViewController {
    func dismissKeyBoard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyBoard() {
        view.endEditing(true)
    }
}

