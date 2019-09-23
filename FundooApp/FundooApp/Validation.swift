//
//  Validation.swift
//  FundooApp
//
//  Created by admin on 21/09/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import UIKit
class Validation{
    
    static let shared = Validation()
    
    private init(){
        
    }

    func isValidEmail(emailStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailStr)
    }

}

