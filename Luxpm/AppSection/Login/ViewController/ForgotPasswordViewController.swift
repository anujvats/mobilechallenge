//
//  ForgotPasswordViewController.swift
//  Luxpm
//
//  Created by Anuj Vats on 31/07/21.
//

import UIKit

class ForgotPasswordViewController: BaseViewController {

    @IBOutlet weak var emailTextField: EmailTextField!
    @IBOutlet weak var submitEmailButton: RoundedButton!
    @IBOutlet weak var emailTextErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        submitEmailButton.disableButton()
        emailTextErrorLabel.isHidden = true
      
    }
    
    
    @IBAction func submitEmail(_ sender: UIButton) {
        navigateToViewController(withIdentifier: "VerifyCodeViewController", object: emailTextField.text)
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        popViewController()
    }
    
    
}

extension ForgotPasswordViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text, !text.isEmpty else {
            return
        }
        
        guard let textField = textField as? ValidateTextFieldDelegate else {
            emailTextErrorLabel.isHidden = false
            return
        }
        textField.validateFieldValue()
        
        if textField.isValidValue {
            emailTextErrorLabel.isHidden = true
            submitEmailButton.enableButton()
        } else {
            textField.handleError()
            emailTextErrorLabel.isHidden = false
            submitEmailButton.disableButton()
        }
       
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        textField.textColor = .black
        emailTextErrorLabel.isHidden = true
        submitEmailButton.disableButton()
        
    }
    
}

