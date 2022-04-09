//
//  URLRequest+Extension.swift
//  VirtualLearnApp
//
//  Created by Anusha on 09/04/22.
//

import Foundation

extension URLRequest {
    
    static func postRequestForSendOTPToRegister(url: URL,body: [String: String]) -> URLRequest {
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body)
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
}
