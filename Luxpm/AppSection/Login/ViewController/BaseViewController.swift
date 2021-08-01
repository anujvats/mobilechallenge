//
//  BaseViewController.swift
//  Luxpm
//
//  Created by Anuj Vats on 01/08/21.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyBoard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func presentAlertView() {
        let alert = UIAlertController(title: "No Account!", message: "We do not found account with this e-mail id", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func popViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func navigateToViewController(withIdentifier identifier: String, object: Any? = nil) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        var resultViewController: UIViewController?
                
        if identifier == "VerifyCodeViewController" {
            if let viewController = sb.instantiateViewController(identifier: identifier) as? VerifyCodeViewController {
                viewController.emailText = object as? String
                resultViewController = viewController
            }
            
        } else {
            resultViewController = sb.instantiateViewController(identifier: identifier)
        }
        
        guard let viewController = resultViewController else {
            return
        }
        
        navigationController?.pushViewController(viewController, animated: true)
    }

}

