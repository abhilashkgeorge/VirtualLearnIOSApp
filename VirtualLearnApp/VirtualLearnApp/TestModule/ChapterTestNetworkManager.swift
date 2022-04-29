//
//  ChapterTestNetworkManager.swift
//  VirtualLearnApp
//
//  Created by Anushree on 28/04/22.
//

import Foundation

class ChapterTestNetworkManager {
    
    func courseTest(url: URL, completionHandler: @escaping (_ json: Any) -> Void) {
        
        let request = URLRequest.getRequestForOverView(url: url)
        
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
    
    func courseGrade(url: URL, completionHandler: @escaping (_ json: Double) -> Void) {
        
        let request = URLRequest.getRequestForOverView(url: url)
        
        let task =  URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No Data")
                return
            }
            
            let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: [])
            
            if let jsonResponse = jsonResponse as? [String: Any],
               let info = jsonResponse["data"] as? Double {
                print(info)
                completionHandler(info)
            }
        }
        task.resume()
    }
    
}
