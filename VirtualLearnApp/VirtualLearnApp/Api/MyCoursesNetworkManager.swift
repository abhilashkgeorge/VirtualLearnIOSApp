//
//  MyCoursesNetworkManager.swift
//  VirtualLearnApp
//
//  Created by Anushree on 15/04/22.
//

import Foundation

class MyCoursesNetworkManager {
    
    func userMyCourses(completionHandler: @escaping (_ json: Any) -> Void) {
        
        let url = URL.fetchURLForMyCourses()
        let request = URLRequest.getRequestForMyCourses(url: url)
        
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
