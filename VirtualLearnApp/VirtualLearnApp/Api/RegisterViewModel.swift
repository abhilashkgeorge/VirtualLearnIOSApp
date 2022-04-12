//
//  LoginRegisterViewModel.swift
//  VirtualLearnApp
//
//  Created by Anushree on 09/04/22.
//

import Foundation
class RegisterViewModel {
    
    var tokenAfterSendingOtp: String = ""
    var tokenAfterVerifingOtp: String = ""
    let manager = LoginRegisterNetworkManager()
   
    func sendOTPForRegistration (mobileNumber: String) {
       
        manager.sendOTP(to: mobileNumber, completionHandler:
                {
                     (json: String?) -> Void
                         in
                    self.tokenAfterSendingOtp = json ?? ""
                    URLRequest.token = self.tokenAfterSendingOtp
                    print("TokenSent:\(self.tokenAfterSendingOtp)")
        })
    }
    
    func verifyOTPForRegistration (otp: Int, completion: @escaping (_ tokenMsg: String) -> Void) {
        
        manager.verifyOTP(to: otp, completionHandler:
                {
                     (json: String?) -> Void
                         in
                    self.tokenAfterVerifingOtp = json ?? ""
                    print("TokenVerify:\(self.tokenAfterVerifingOtp)")
                    URLRequest.tokenForRegistration =  self.tokenAfterVerifingOtp
                    completion(self.tokenAfterVerifingOtp)
        })
    }
        
    func registerOfUser(fullname: String, username: String, email: String, password: String, confirmpassword: String) {
        manager.userRegistration(fullname: fullname, username: username, email: email, password: password, confirmpassword: confirmpassword, completionHandler: {
            (json: String?) -> Void
                in
                self.tokenAfterVerifingOtp = json ?? ""
                print("Token:\(self.tokenAfterVerifingOtp)")
          
        })
    }
}
