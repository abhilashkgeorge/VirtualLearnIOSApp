//
//  TestNetworkManager.swift
//  VirtualLearnApp
//
//  Created by Prajna P on 25/04/22.
//

import Foundation

class TestNetworkManager {
    
    func userTest(courseId: String, chapterNumber: String, testName: String, completionHandler: @escaping (_ token: String?) -> Void) {
        
        let url = URL.fetchURLForTest()
        let httpBody: [String: String] = [
            
            "courseId": courseId,
            "chapterNumber": chapterNumber,
            "testName": testName
//            Question : questions,
//            Duration : duration
            
        ]
        let request = URLRequest.postRequestForTests(url: url, body: httpBody)
        let task =  URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No Data")
                completionHandler(nil)
                return
            }

            let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: [])

            if let jsonResponse = jsonResponse as? [String: Any],
               let meta = jsonResponse["meta"] as? [String: Any],
               let code = meta["code"] as? Int {
                print(jsonResponse)
                if code == 200 {
                    if let token = meta["token"] as? String {
                        print(token)
                        completionHandler(token)
                    }else {
                        completionHandler(nil)
                    }
                }
                else if code == 400 {
                    completionHandler("Invalid credential or password")
                }
                else {
                    completionHandler(nil)
                }
            }
        }
        task.resume()
    }
    
    
}

//    "courseId":"62274feaf5a5db4553d89475",
//    "chapterNumber":1,
//    "testName":"final test ",
//    "questions":[{"questionNumber":1,"question":"What is value of 4+6","choices":[10,5,7,4],"correctAnswer":10},{"questionNumber":2,"question":"What is value of 5+5","choices":[10,55,10,4],"correctAnswer":10}],
//    "duration":[{"hours":3,"minutes":58,"seconds":50}]
