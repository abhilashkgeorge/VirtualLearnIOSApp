//
//  LoginRegisterNetworkManager.swift
//  VirtualLearnApp
//
//  Created by Anushree on 09/04/22.
//

import Foundation

class LoginRegisterNetworkManager {
    
    func userLogin(username: String, password: String, completionHandler: @escaping (_ token: String?) -> Void) {
        
        let url = URL.fetchURLForuserLogin()
        let httpBody: [String: String] = [
            
                "userName": username,
                "password": password
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
                    if let token = meta["token"] as? String {
                        print(token)
                        completionHandler(token)
                    }else {
                        completionHandler(nil)
                    }
                }
                else if code == 404 {
                    completionHandler("Invalid credential or password")
                }
                else {
                    completionHandler(nil)
                }
            }
        }
        task.resume()
    }
    
    func sendOTP(to mobileNumber: String, completionHandler: @escaping (_ token: String?) -> Void) {
        
        let url = URL.fetchURLForSendOTPToRegister()
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
                if code == 201 {
                    if let token = meta["token"] as? String {
                        completionHandler(token)
                    }else {
                        completionHandler(nil)
                    }
                }
                else if code == 400 {
                    completionHandler(nil)
                }
                else {
                    completionHandler(nil)
                }
            }
        }
        task.resume()
    }
    
    func verifyOTP(to otp: String, completionHandler: @escaping (_ token: String?) -> Void) {
       
        let url = URL.fetchURLForVerifyOTPToRegister()
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
                    if let token = meta["token"] as? String {
                        completionHandler(token)
                    }else {
                        completionHandler(nil)
                    }
                }
                else {
                    completionHandler(nil)
                }
            }
        }
        task.resume()
    }
    
    func userRegistration(fullname: String, username: String, email: String, password: String, confirmpassword: String, completionHandler: @escaping (_ token: String?) -> Void) {
        
        let url = URL.fetchURLForRegistration()
        let httpBody: [String: String] = [
            
            "fullName": fullname,
            "userName": username,
            "email": email,
            "password": password,
            "confirmPassword": confirmpassword
        ]
        let request = URLRequest.postRequestForUserRegistration(url: url, body: httpBody)
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
                if code == 201 {
                    if let token = meta["message"] as? String {
                        print(token)
                        completionHandler(token)
                    }else {
                        completionHandler(nil)
                    }
                }
                else if code == 404 {
                    completionHandler("Invalid credential or password")
                }
                else {
                    completionHandler(nil)
                }
            }
            else {
                completionHandler("password should be atleast 6 characters long with 'one number','one uppercase letter' and 'one lowercase letter'")
            }
        }
        task.resume()
    }
}
