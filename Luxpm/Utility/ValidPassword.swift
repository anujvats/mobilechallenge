//
//  ValidPassword.swift
//  Luxpm
//
//  Created by Anuj Vats on 01/08/21.
//

import Foundation

@propertyWrapper
struct Password<Value: StringProtocol> {
    
    var value: Value?
    
    var wrappedValue: Value? {
        get {
            return validate(password: value) ? value : nil
        }
        set {
            value = newValue
        }
    }
    
    private func validate(password: Value?) -> Bool {
        guard let password = password else { return false }
        if password.count > 6 && password.count < 15 {
            return true
        }
        return false
    }
}
