//
//  OverviewNetworkManager.swift
//  VirtualLearnApp
//
//  Created by Anushree on 23/04/22.
//

import Foundation

class OverviewNetworkManager {
    
    func courseOverview(url: URL, completionHandler: @escaping (_ json: Any) -> Void) {
        
        let request = URLRequest.getRequestForOverView(url: url)
        
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
}
