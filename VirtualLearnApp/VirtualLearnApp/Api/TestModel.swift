//
//  TestModel.swift
//  VirtualLearnApp
//
//  Created by Prajna P on 22/04/22.
//

import Foundation
//"questions":[{"questionNumber":1,"question":"What is value of 4+6","choices":[10,5,7,4],"correctAnswer":10},{"questionNumber":2,"question":"What is value of 5+5","choices":[10,55,10,4],"correctAnswer":10}],
//    "duration":[{"hours":3,"minutes":58,"seconds":50}]


class Question {
    var questionNumber : Int
    var question : String
    var choices : [String]
    var correctAnswer : String
    
    init(questionNumber : Int,question : String, choices : [String], correctAnswer : String){
        self.questionNumber = questionNumber
        self.question = question
        self.choices = choices
        self.correctAnswer = correctAnswer
    }
    
}

class Duration {
    var hours : Int
    var minutes : Int
    var seconds : Int
    
    
    init(hours : Int,minutes : Int, seconds : Int){
        self.hours = hours
        self.minutes = minutes
        self.seconds = seconds
    }
    
}
