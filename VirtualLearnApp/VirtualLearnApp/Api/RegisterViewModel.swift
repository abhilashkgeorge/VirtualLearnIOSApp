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
   
    func sendOTPForRegistration (mobileNumber: String, completion: @escaping (_ tokenMsg: String) -> Void) {
       
        manager.sendOTP(to: mobileNumber, completionHandler:
                {
                     (json: String?) -> Void
                         in
                    self.tokenAfterSendingOtp = json ?? ""
                    URLRequest.token = self.tokenAfterSendingOtp
                    print("TokenSent:\(self.tokenAfterSendingOtp)")
                    completion(self.tokenAfterSendingOtp)
        })
    }
    
    func verifyOTPForRegistration (otp: String, completion: @escaping (_ tokenMsg: String) -> Void) {
        print("otpinvm:\(otp)")
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
        
    func registerOfUser(fullname: String, username: String, email: String, password: String, confirmpassword: String,completion: @escaping (_ tokenMsg: String) -> Void) {
        manager.userRegistration(fullname: fullname, username: username, email: email, password: password, confirmpassword: confirmpassword, completionHandler: {
            (json: String?) -> Void
                in
            print("Message:\(String(describing: json))")
            completion(json ?? "no message")
          
        })
    }
    
    let forgotPassManager = ForgotPasswordNetworkManager()
    var resetPassMsg = ""
    var msgVerifyOTPForgotPass = ""
    
    func sendOTPForForgotPassword (mobileNumber: String, completion: @escaping (_ tokenMsg: String) -> Void) {
        forgotPassManager.sendOTPForgotPassword(to: mobileNumber, completionHandler:
                {
                     (json: String?) -> Void
                         in
                    self.tokenAfterSendingOtp = json ?? ""
                    URLRequest.token = self.tokenAfterSendingOtp
                    print("TokenSent:\(self.tokenAfterSendingOtp)")
                    completion(self.tokenAfterSendingOtp)
        })
    }

    func verifyOTPForForgotPassword (otp: String, completion: @escaping (_ tokenMsg: String) -> Void) {
        print("otpinvm:\(otp)")
        forgotPassManager.verifyOTPForgotPassword(to: otp, completionHandler:
                {
                     (json: String?) -> Void
                         in
                    self.msgVerifyOTPForgotPass = json ?? ""
                    print("messageverifyOTPForForgotPassword:\(self.msgVerifyOTPForgotPass)")
                    completion(self.msgVerifyOTPForgotPass)
        })
    }

    func resetPassword(password: String, confirmPassword: String, completion: @escaping (_ tokenMsg: String) -> Void) {
        forgotPassManager.resetForgotPassword(password: password, confirmPassword: confirmPassword, completionHandler:
                {
                     (json: String?) -> Void
                         in
                    self.resetPassMsg = json ?? ""
                    print("messageResetPassword:\(self.resetPassMsg)")
                    completion(self.resetPassMsg)
                })
    }
    
}
