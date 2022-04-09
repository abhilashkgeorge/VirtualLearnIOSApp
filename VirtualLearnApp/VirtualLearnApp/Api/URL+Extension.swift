//
//  URL+Extension.swift
//  VirtualLearnApp
//
//  Created by Anushree on 09/04/22.
//

import Foundation
extension URL {
    
    static func fetchURLForSendOTPToRegister() -> URL {
        
        guard let url = URL(string: "https://virtuallearn2.herokuapp.com/api/v1/virtualLearn/register/sendOtp") else {
                    fatalError("Error getting URL")
            }
        return url
    }
}
