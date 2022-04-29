//
//  ChapterTestDataModel.swift
//  VirtualLearnApp
//
//  Created by Anushree on 28/04/22.
//

import Foundation

class ChapterTestDataModel {
    
    var testID: String
    var courseID: String
    var testName: String
     
    init(testID: String, courseID: String, testName: String){
        
        self.testID = testID
        self.courseID = courseID
        self.testName = testName
      
    }
}

class QuestionDataModel {
    
    var questionNumber : Int
    var question : String
    var choices : [String]
    
    init(questionNumber : Int,question : String, choices : [String]){
        
        self.questionNumber = questionNumber
        self.question = question
        self.choices = choices
    }
}

class QuestionAndAnswers {
    
    var chapter: ChapterTestDataModel
    var questions: [QuestionDataModel]
    
    init(chapter: ChapterTestDataModel, questions: [QuestionDataModel]) {
        
        self.chapter = chapter
        self.questions = questions
    }
}

class UserMarkedAnswers {
    
    var testID: String
    var chapterNo: Int
    var score: Int
    var totalQuestions: Int
    var markedAnswers: [Int: String]
    
    init(testID: String, chapterNo: Int, score: Int, totalQuestions: Int, markedAnswers: [Int: String]){
        
        self.testID = testID
        self.chapterNo = chapterNo
        self.score = score
        self.totalQuestions = totalQuestions
        self.markedAnswers = markedAnswers
        
    }
}

class AnswerKey {
    
    var testID: String
    var courseID: String
    var testName: String
    var realAnswers: [Int: String]
    
    init(testID: String, courseID: String, testName: String, realAnswers: [Int: String]) {
        
        self.testID = testID
        self.courseID = courseID
        self.testName = testName
        self.realAnswers = realAnswers
        
    }
}


