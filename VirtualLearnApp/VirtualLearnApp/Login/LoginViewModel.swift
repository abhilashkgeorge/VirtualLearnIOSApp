//
//  LoginRegisterModel.swift
//  VirtualLearnApp
//
//  Created by Anushree on 09/04/22.
//

import Foundation
class LoginViewModel {
    
    var commonTokenAfterLogin: String = ""
    let manager = LoginRegisterNetworkManager()
    
    func loginOfUser (username: String, password: String, completion: @escaping (_ tokenMsg: String) -> Void) {
        manager.userLogin(username: username,password: password, completionHandler:
                {
                     (json: String?) -> Void
                         in
                    self.commonTokenAfterLogin = json ?? ""
                    print("Token:\(self.commonTokenAfterLogin)")
                    URLRequest.commonToken = self.commonTokenAfterLogin
                    completion(self.commonTokenAfterLogin)
        })
    }
}

