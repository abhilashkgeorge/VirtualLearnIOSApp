//
//  SearchNetworkManager.swift
//  VirtualLearnApp
//
//  Created by Anusha on 16/04/22.
//

import Foundation
class SearchNetworkManager {
    func search(name: String, category: String, totalChapters: Int,completionHandler: @escaping (_ searchData: Any) -> Void) {
        
        let url = URL.fetchURLForSearch()
        let httpBody: [String: Any] = [
            
            "courseName": name,
            "category": category,
            "totalChapters": totalChapters,
            
        ]
        
        let request = URLRequest.postRequestForSearch(url: url, body: httpBody)
        let task =  URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No Data")
                return
            }

            let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: [])

            if let jsonResponse = jsonResponse as? [String: Any],
               let meta = jsonResponse["meta"] as? [String: Any],
               let code = meta["code"] as? Int {
                print(jsonResponse)
                if code == 200 {
                    if let data = jsonResponse["data"] as? [[String: Any]] {
                       // print(data)
                        completionHandler(data)
                    }
                    else {
                        print("error1")
                    }
                }
                else if code == 400 {
                    print("Courses Not Available")
                    completionHandler(data)
                }
                else {
                    print("error3")
                }
            }
        }
        task.resume()
    }
}
