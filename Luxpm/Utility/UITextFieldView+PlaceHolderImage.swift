//
//  UItextFieldView+PlaceHolderImage.swift
//  Luxpm
//
//  Created by Anuj Vats on 31/07/21.
//

import UIKit

extension UITextField {
    func setPlaceHolderImage(_ imageName: String, withFrame frame: CGRect ) {
        guard let image = UIImage(named: imageName) else {
            return
        }
        let iconView = UIImageView(frame: frame)
        iconView.image = image
        let iconContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 46, height: 20))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}

enum TextFieldType {
    case password
    case email
}


protocol ValidateTextFieldDelegate {
    var isValidValue: Bool { get }
    var textFieldType: TextFieldType { get }
    func validateFieldValue()
    func handleError()
    func clearText()
}

class CustomTextField: UITextField {
    
    func handleError() {
        textColor = .red
    }
    
    func clearText() {
        text = ""
    }
}

class EmailTextField: CustomTextField, ValidateTextFieldDelegate {
    
    var isValidValue: Bool {
        guard let _ = emailText else {
            return false
        }
        return true
    }
    
    var textFieldType: TextFieldType = .email

    @Email
    var emailText: String?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        let requiredFrame = CGRect(x: 0, y: 0, width: 24, height: 20)
        setPlaceHolderImage("email", withFrame: requiredFrame)
    }
 
    func validateFieldValue() {
        emailText = text
    }
    
}

class PasswordTextField: CustomTextField, ValidateTextFieldDelegate {
    
    var isValidValue: Bool {
        guard let _ = passwordText else {
            return false
        }
        return true
    }
    
    var textFieldType: TextFieldType = .password
    
    @Password
    var passwordText: String?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        let requiredFrame = CGRect(x: 0, y: 0, width: 19, height: 22)
        setPlaceHolderImage("password", withFrame: requiredFrame)
    }
    
    func validateFieldValue() {
        passwordText = text
    }
    
}
