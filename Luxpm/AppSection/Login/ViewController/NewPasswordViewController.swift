//
//  NewPasswordViewController.swift
//  Luxpm
//
//  Created by Anuj Vats on 01/08/21.
//

import UIKit

class NewPasswordViewController: BaseViewController {
    
    @IBOutlet weak var newPasswordButton: RoundedButton!
    @IBOutlet weak var passwordTextErrorLabel: UILabel!
    @IBOutlet weak var passwordTextField: PasswordTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        passwordTextField.delegate = self
        passwordTextErrorLabel.isHidden = true
        newPasswordButton.disableButton()
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        popViewController()
    }

}

extension NewPasswordViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text, !text.isEmpty else {
            return
        }
        
        guard let textField = textField as? ValidateTextFieldDelegate else {
            passwordTextErrorLabel.isHidden = false
            return
        }
        textField.validateFieldValue()
        
        if textField.isValidValue {
            passwordTextErrorLabel.isHidden = true
            newPasswordButton.enableButton()
        } else {
            textField.handleError()
            passwordTextErrorLabel.isHidden = false
            newPasswordButton.disableButton()
        }
       
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        textField.textColor = .black
        passwordTextErrorLabel.isHidden = true
        newPasswordButton.disableButton()
        
    }
    
}
