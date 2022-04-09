//
//  LoginRegisterViewModel.swift
//  VirtualLearnApp
//
//  Created by Anushree on 09/04/22.
//

import Foundation
class LoginRegisterViewModel {
    
    func sendOTPForRegistration (mobileNumber: String) {
        let manager = LoginRegisterNetworkManager()
        manager.sendOTP(to: mobileNumber, completionHandler:
                {
                     (json: Any) -> Void
                         in
                    print(json)
        })
    }
}
