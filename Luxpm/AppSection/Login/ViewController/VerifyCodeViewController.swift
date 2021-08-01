//
//  VerifyCodeViewController.swift
//  Luxpm
//
//  Created by Anuj Vats on 01/08/21.
//

import UIKit
import OTPFieldView

class VerifyCodeViewController: BaseViewController {
    
    @IBOutlet weak var verifyButton: RoundedButton!
    @IBOutlet weak var otpTextFieldView: OTPFieldView!
    @IBOutlet weak var verifyCodeLabel: UILabel!
    @IBOutlet weak var submitButton: RoundedButton!

    var emailText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.disableButton()
        setUpOTPTextFieldView()
        setUpVerifyLabel()
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        popViewController()
    }
    
    @IBAction func navigateToNewPassword(_ sender: UIButton) {
        navigateToViewController(withIdentifier: "NewPasswordViewController")
    }
    
    private func setUpVerifyLabel() {
        guard let emailText = emailText else { return }
        verifyCodeLabel.text = "A code has been send to your \(emailText). Please enter the code below"
    }

    private func setUpOTPTextFieldView() {
        otpTextFieldView.fieldsCount = 6
        otpTextFieldView.fieldBorderWidth = 2
        otpTextFieldView.otpInputType = .numeric
        otpTextFieldView.defaultBorderColor = .black
        otpTextFieldView.filledBorderColor = .black
        otpTextFieldView.displayType = .underlinedBottom
        otpTextFieldView.fieldSize = 40
        otpTextFieldView.separatorSpace = 8
        otpTextFieldView.shouldAllowIntermediateEditing = false
        otpTextFieldView.delegate = self
        otpTextFieldView.initializeUI()
    }
}

extension VerifyCodeViewController: OTPFieldViewDelegate {
    
    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }
    
    func enteredOTP(otp: String) {
        print(otp)
    }
    
    func hasEnteredAllOTP(hasEnteredAll: Bool) -> Bool {
        
        if hasEnteredAll {
            submitButton.enableButton()
        } else {
            submitButton.disableButton()
        }
        return false
    }
}
