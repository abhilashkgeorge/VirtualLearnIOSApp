//
//  TestViewModel.swift
//  VirtualLearnApp
//
//  Created by Prajna P on 23/04/22.
//

import Foundation

struct MarkedAns {
    var questionNumber: Int
    var userAnswer: String
    
    init(questionNumber: Int,userAnswer: String) {
        self.questionNumber = questionNumber
        self.userAnswer = userAnswer
    }
}

class TestViewModel {
    
    let manager = TestNetworkManager()
    
    func userAnswer(courseId: String, testId: String, chapterNumber: Int , score: Int, markedAnswer: [[String:Any]]) {
        manager.userAnswerNetworkManagerCall(courseId: courseId, testId: testId, chapterNumber: chapterNumber, score:score, markedAnswer: markedAnswer)
    }
}
//var markedAns: [[String: Any]] = Array(repeating: [:], count: 3)
//let question: [Int] = [1,2,3]
//let ans: [String] = [ "service","Decorator pattern","MPAs"]
//for i in 0..<3{
//    markedAns[i] = ["questionNumber": question[i], "userAnswer": ans[i]]
//}
//print(markedAns)
//vm.userAnswer(courseId: "62274ebff5a5db4553d89454", testId: "6231b26573a9ff43ed8fc056", chapterNumber: 1, score: 2, markedAnswer: markedAns)
