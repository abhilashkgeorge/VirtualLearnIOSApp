//
//  URLRequest+Extension.swift
//  VirtualLearnApp
//
//  Created by Anusha on 09/04/22.
//

import Foundation

extension URLRequest {
    static var token: String = ""
    static var tokenForRegistration: String = ""
    static func postRequestForSendOTPToRegisterAndUserLogin(url: URL,body: [String: String]) -> URLRequest {
        
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
    
    static func postRequestForVerifyOTPToRegister(url: URL,body: [String: Int]) -> URLRequest {

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body)
        } catch let error {
            print(error.localizedDescription)
        }
        print("viewmodel:\(token)")
        request.setValue("jwt \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    static func postRequestForUserRegistration(url: URL,body: [String: String]) -> URLRequest {

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body)
        } catch let error {
            print(error.localizedDescription)
        }
        print("viewmodel:\(tokenForRegistration)")
        request.setValue("jwt \(tokenForRegistration)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    static func getRequestForHome(url: URL) -> URLRequest {
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        request.setValue("jwt ", forHTTPHeaderField: "Authorization")
        return request
    }
}
