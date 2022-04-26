//
//  ChangePasswordNetworkManager.swift
//  VirtualLearnApp
//
//  Created by Anushree on 20/04/22.
//

import Foundation

class ChangePasswordNetworkManager {
    
    func userChangePassword(currentPassword: String, newPassword: String, confirmpassword: String, completionHandler: @escaping (_ token: String?) -> Void) {
        
        let url = URL.fetchURLForChangePassword()
        let httpBody: [String: String] = [
            
            "currentPassword": currentPassword,
            "password": newPassword,
            "confirmPassword": confirmpassword,
            
        ]
        let request = URLRequest.postRequestForChangePassword(url: url, body: httpBody)
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
                    if let token = meta["message"] as? String {
                        completionHandler(token)
                    }else {
                        completionHandler(nil)
                    }
                }
                else if code == 404 {
                    completionHandler("Cannot change password!!!")
                }
                else {
                    completionHandler(nil)
                }
            }
        }
        task.resume()
    }
    
    
    
}
