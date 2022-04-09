//
//  LoginRegisterNetworkManager.swift
//  VirtualLearnApp
//
//  Created by Anushree on 09/04/22.
//

import Foundation

class LoginRegisterNetworkManager {
    
    func sendOTP(to mobileNumber: String, completionHandler: @escaping (_ token: Any?) -> Void) {
        
        let url = URL.fetchURLForSendOTPToRegister()
        
        let httpBody: [String:String] = [
            
                "phoneNumber": mobileNumber
        ]
        
        let request = URLRequest.postRequestForSendOTPToRegister(url: url, body: httpBody)
            
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if error != nil{
                print(error!)
                return
            }
            
            if let data = data {
                do {
                    
                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                    completionHandler(jsonResponse)
                    
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
}
