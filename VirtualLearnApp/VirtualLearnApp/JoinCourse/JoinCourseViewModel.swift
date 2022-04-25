//
//  JoinCourseViewModel.swift
//  VirtualLearnApp
//
//  Created by Anushree on 24/04/22.
//

import Foundation

class JoinCourseViewModel {
    
    let manager = JoinCourseNetworkManager()
    
    func joiningNewCourse(name: String, id: String, completionHandler: @escaping (_ successMessage: String?) -> Void) {
        
        let url = URL.fetchURLForJoinCourse(courseID: id, courseTitle: name)
        
        manager.joiningCourse(url: url, completionHandler:
                                {
                                    (json: String?) -> Void
                                    in
                                    let successMessage = json ?? ""
                                    completionHandler(successMessage)
                                }
        )
    }
    
}
