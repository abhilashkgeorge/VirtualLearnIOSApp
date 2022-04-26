//
//  JoinCourseNetworkManager.swift
//  VirtualLearnApp
//
//  Created by Anushree on 24/04/22.
//

import Foundation

class JoinCourseNetworkManager {
    
    func joiningCourse(url: URL, completionHandler: @escaping (_ message: String?) -> Void) {
        
        let request = URLRequest.getRequestForJoinCourse(url: url)
        
        let task =  URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No Data")
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
                
                else if code == 400 {
                    if let token = meta["message"] as? String {
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
    
}
