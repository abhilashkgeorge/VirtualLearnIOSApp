//
//  ChangePasswordViewModel.swift
//  VirtualLearnApp
//
//  Created by Anushree on 20/04/22.
//

import Foundation

class ChangePasswordViewModel {
    
    let manager = ChangePasswordNetworkManager()
    
    func changeUserPassword(currentPassword: String, newPassword: String, confirmPassword: String, completionHandler: @escaping (_ successMessage: String) -> Void) {
        
        manager.userChangePassword(currentPassword: currentPassword, newPassword: newPassword, confirmpassword: confirmPassword, completionHandler:  {
            
            (json: String?) -> Void
                in
            print("Change password message:\(String(describing: json))")
            completionHandler(json ?? "no message")
        })
    }
}
