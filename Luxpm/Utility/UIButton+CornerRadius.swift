//
//  UIButton+CornerRadius.swift
//  Luxpm
//
//  Created by Anuj Vats on 01/08/21.
//

import UIKit

class RoundedButton: UIButton {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layer.cornerRadius = 5.0
    }
    
    func disableButton() {
        alpha = 0.4
        isEnabled = false
    }
    
    func enableButton() {
        alpha = 1.0
        isEnabled = true
    }
}
