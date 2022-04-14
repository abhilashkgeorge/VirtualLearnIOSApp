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
                print(info)
                completionHandler(info)
            }
        }
        task.resume()
    }
}
