//
//  TestViewModel.swift
//  VirtualLearnApp
//
//  Created by Prajna P on 23/04/22.
//

import Foundation
class TestViewModel {
    
    var commonTokenForTest: String = ""
    let manager = TestNetworkManager()
    
    func loginOfUser (courseId: String, chapterNumber: String, testName: String, completion: @escaping (_ tokenMsg: String) -> Void) {
        manager.userTest(courseId: courseId, chapterNumber: chapterNumber, testName: testName, completionHandler:
                {
                     (json: String?) -> Void
                         in
                    self.commonTokenForTest = json ?? ""
                    URLRequest.commonToken = self.commonTokenForTest
                    completion(self.commonTokenForTest)
        })
    }
}
