//
//  HomeNetworkManager.swift
//  VirtualLearnApp
//
//  Created by Abhilash k George on 14/04/22.
//

import Foundation

class HomeNetworkManager {
    
    func userHome() {
        let url = URL.fetchURLForHomePage()
        let request = URLRequest.getRequestForHome(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error != nil else {
                print(error?.localizedDescription ?? "Failed to gather data")
                return
            }
            
            let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: [])
            
            if let jsonResponse = jsonResponse as? [String: Any],
            let info = jsonResponse["data"] as? [String: Any] {
                print(info)
            }
        }
        task.resume()
    }

}
