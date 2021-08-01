//
//  LoginViewController.swift
//  Luxpm
//
//  Created by Anuj Vats on 31/07/21.
//

import UIKit

class LoginViewController: BaseViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var emailTextField: EmailTextField!
    @IBOutlet weak var passwordTextField: PasswordTextField!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var loginButton: RoundedButton!
    
    var validPassword: Bool = false
    var validEmail: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailTextField.delegate = self
        passwordTextField.delegate = self
        emailErrorLabel.isHidden = true
        passwordErrorLabel.isHidden = true
        shouldEnableLoginButton()
    }
    
    @IBAction func didTapOnLoginButton(_ sender: UIButton) {
       
        if emailTextField.text == "test@luxpmsoft.com" && passwordTextField.text == "test1234!" {
            UIApplication.shared.windows.first?.rootViewController = setUpHomeNavigationSetUp()
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        } else {
            presentAlertView()
        }
    }
    
    @IBAction func didTapOnForgotPassword(_ sender: UIButton) {
        navigateToViewController(withIdentifier: "ForgotPasswordViewController")
    }
    
    // Extend functionality for SignUp
    @IBAction func didTapOnSignUp(_ sender: UIButton) {
        
    }
    
    func shouldEnableLoginButton() {
        if validPassword && validEmail {
            loginButton.enableButton()
        } else {
            loginButton.disableButton()
        }
    }
    
    func setUpHomeNavigationSetUp() -> UINavigationController {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .white
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }

}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let textField = textField as? ValidateTextFieldDelegate else {
            emailErrorLabel.isHidden = false
            passwordErrorLabel.isHidden = false
            return
        }
        
        textField.validateFieldValue()

        if textField.isValidValue {
            emailErrorLabel.isHidden = true
            passwordErrorLabel.isHidden = true
            switch textField.textFieldType {
            case .email:
                validEmail = true
            case .password:
                validPassword = true
            }
        } else {
            textField.handleError()
            switch textField.textFieldType {
            case .email:
                validEmail = false
                emailErrorLabel.isHidden = false
            case .password:
                validPassword = false
                passwordErrorLabel.isHidden = false
            }
        }
        
        shouldEnableLoginButton()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        textField.textColor = .black
        shouldEnableLoginButton()
        
        guard let textField = textField as? ValidateTextFieldDelegate else {
            return
        }
        
        if !textField.isValidValue {
            textField.clearText()
        }
        
        emailErrorLabel.isHidden = true
        passwordErrorLabel.isHidden = true
    }
    
}
