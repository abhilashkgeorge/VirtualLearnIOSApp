//
//  NotificationsNetworkManager.swift
//  VirtualLearnApp
//
//  Created by Prajna P on 13/04/22.
//

import Foundation
import UIKit

class NotificationsNetworkManager {
    
    func userNotifications(completionHandler: @escaping (_ json: [[String: Any]]) -> Void) {
        
        let url = URL.fetchURLForNotifications()
        let request = URLRequest.getRequestForNotifications(url: url)
        
        let task =  URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No Data")
                return
            }
            
            let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: [])
            
            if let jsonResponse = jsonResponse as? [String: Any],
                let info = jsonResponse["data"] as? [[String: Any]] {
                    print("network\(info)")
                    completionHandler(info)
                }
            
            else {
                print("error")
            }
        }
        task.resume()
    }
}
