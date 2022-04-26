//
//  ForgotPasswordNetworkManager.swift
//  VirtualLearnApp
//
//  Created by Anusha on 20/04/22.
//

import Foundation

class ForgotPasswordNetworkManager {
    
    func sendOTPForgotPassword(to mobileNumber: String, completionHandler: @escaping (_ token: String?) -> Void) {
        
        let url = URL.fetchURLForForgotPasswordSndOTP()
        let httpBody: [String:String] = [
            
                "phoneNumber": mobileNumber
        ]
        let request = URLRequest.postRequestForSendOTPToRegisterAndUserLogin(url: url, body: httpBody)
        let task =  URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No Data")
                completionHandler(nil)
                return
            }

            let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: [])

            if let jsonResponse = jsonResponse as? [String: Any],
               let meta = jsonResponse["meta"] as? [String: Any],
               let code = meta["code"] as? Int {
                print(jsonResponse)
                if code == 201 {
                    if let token = meta["token"] as? String {
    
                        completionHandler(token)
                    }else {
                        completionHandler(nil)
                    }
                }
                else {
                    completionHandler(nil)
                    print("Error")
                }
            }
        }
        task.resume()
    }
    
    func verifyOTPForgotPassword(to otp: String, completionHandler: @escaping (_ tokenMsg: String?) -> Void) {
       
        let url = URL.fetchURLForForgotPasswordVerifyOTP()
        let httpBody: [String: String] = [
            
                "otp": otp
        ]
        let request = URLRequest.postRequestForVerifyOTPToRegister(url: url, body: httpBody)
        let task =  URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No Data")
                completionHandler(nil)
                return
            }

            let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: [])

            if let jsonResponse = jsonResponse as? [String: Any],
               let meta = jsonResponse["meta"] as? [String: Any],
               let code = meta["code"] as? Int {

                if code == 200 {
                    if let tokenMsg = meta["message"] as? String {
                        print(tokenMsg)
                        completionHandler(tokenMsg)
                    }else {
                        completionHandler(nil)
                    }
                }
                else {
                    print("error")
                    completionHandler(nil)
                }
            }
        }
        task.resume()
    }
    
    func resetForgotPassword(password: String, confirmPassword: String, completionHandler: @escaping (_ message: String?) -> Void) {
       
        let url = URL.fetchURLForForgotPasswordReset()
        let httpBody: [String: String] = [
            "password": password,
            "confirmPassword": confirmPassword
        ]
        let request = URLRequest.postRequestForSendOTPToRegisterAndUserLogin(url: url, body: httpBody)
        
        let task =  URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No Data")
                completionHandler(nil)
                return
            }

            let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: [])

            if let jsonResponse = jsonResponse as? [String: Any],
               let meta = jsonResponse["meta"] as? [String: Any],
               let code = meta["code"] as? Int {
                if code == 200 {
                    if let message = meta["message"] as? String {
                        completionHandler(message)
                    }else {
                        completionHandler(nil)
                    }
                }
                else {
                    completionHandler("password should be atleast 6 characters long with 'one number','one uppercase letter' and 'one lowercase letter'")
                }
            }
            else {
                completionHandler("password should be atleast 6 characters long with 'one number','one uppercase letter' and 'one lowercase letter'")
            }
        }
        task.resume()
    }
}
