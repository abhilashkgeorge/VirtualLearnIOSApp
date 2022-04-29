//
//  TestNetworkManager.swift
//  VirtualLearnApp
//
//  Created by Prajna P on 25/04/22.
//

import Foundation

class TestNetworkManager {
    
    func userAnswerNetworkManagerCall(courseId: String, testId: String, chapterNumber: Int, score: Int, markedAnswer: [[String:Any]]) {
        
        let url = URL.fetchURLForTestUserAnswer()
        
        let httpBody: Dictionary<String,Any> = [
            "courseId": courseId,
            "testId": testId,
            "chapterNo": chapterNumber,
            "markedAnswer": markedAnswer,
            "score": score,
        ]
        
        let request = URLRequest.postRequestForTests(url: url, body: httpBody)
        let task =  URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No Data")
               // completionHandler(nil)
                return
            }

            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                if let jsonResponse = jsonResponse as? [String: Any],
                   let meta = jsonResponse["meta"] as? [String: Any],
                   let code = meta["code"] as? Int {

                    if code == 200 {
                        if let msg = meta["message"] as? String {
                            print("**********")
                            print(msg)
                          //  completionHandler(token)
                        }else {
                            print("error")
                          //  completionHandler(nil)
                        }
                    }
                    else if code == 400 {
                        print("error")
                        //completionHandler("Invalid credential or password")
                    }
                    else {
                        print("error")
                      //  completionHandler(nil)
                    }
                }
               } catch {
                   print("HI")
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
