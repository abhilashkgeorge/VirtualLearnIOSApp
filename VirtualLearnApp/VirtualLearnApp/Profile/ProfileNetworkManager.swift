//
//  ProfileNetworkManager.swift
//  VirtualLearnApp
//
//  Created by Anushree on 13/04/22.
//

import Foundation

class ProfileNetworkManager {
    
    func userProfile(completionHandler: @escaping (_ json: Any) -> Void) {
        
        let url = URL.fetchURLForMyProfile()
        let request = URLRequest.getRequestForMyProfile(url: url)
        
        let task =  URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No Data")
                return
            }
            
            let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: [])
            
            if let jsonResponse = jsonResponse as? [String: Any],
               let info = jsonResponse["data"] as? [String: Any] {
                completionHandler(info)
            }
        }
        task.resume()
    }
    
    func editProfile(email: String, occupation: String, gender: String, dob: String, twitterLink: String, facebookLink: String, completionHandler: @escaping (_ message: String?) -> Void) {
        
        let url = URL.fetchURLForEditProfile()
        let httpBody: [String: String] = [
            
            "email":email,
            "occupation": occupation,
            "gender": gender,
            "dob": dob,
            "twitterLink": twitterLink,
            "facebookLink": facebookLink
        ]
        
        let request = URLRequest.postRequestForEditProfile(url: url, body: httpBody)
        let task =  URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completionHandler(nil)
                return
            }
            
            let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: [])

            if let jsonResponse = jsonResponse as? [String: Any],
               let meta = jsonResponse["meta"] as? [String: Any],
               let code = meta["code"] as? Int {
                if code == 200 {
                    if let msg = meta["message"] as? String {
                        completionHandler(msg)
                    }else {
                        completionHandler(nil)
                    }
                }
                else if code == 400 {
                    completionHandler("Invalid credential or password")
                }
                else {
                    completionHandler(nil)
                }
            }else {
                print("error!!!!!!!!!")
            }
        }
        task.resume()
    }
}
