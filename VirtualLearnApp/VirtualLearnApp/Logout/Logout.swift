//
//  Logout.swift
//  VirtualLearnApp
//
//  Created by Anushree on 25/04/22.
//

import Foundation

class Logout {
    
    func logout(url: URL, completionHandler: @escaping (_ json: Any) -> Void) {
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?)
            in
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No Data")
                return
            }
            
            let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: [])
            
            if let jsonResponse = jsonResponse as? [String: Any]{
                print(jsonResponse)
                completionHandler(jsonResponse)
                
            }
        }
        task.resume()
    }
}
