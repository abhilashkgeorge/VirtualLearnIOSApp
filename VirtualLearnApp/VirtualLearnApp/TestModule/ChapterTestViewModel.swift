//
//  ChapterTestViewModel.swift
//  VirtualLearnApp
//
//  Created by Anushree on 28/04/22.
//

import Foundation

class ChapterTestViewModel {
    
    let manager = ChapterTestNetworkManager()
    
    var allQuestions = [QuestionDataModel]()
    
    func serializeQuestionsAndChoices(json: Any)-> QuestionAndAnswers {
        
        let jsonData = json as? [String: AnyObject]
        let chapterTestDetails = jsonData!["testDetails"] as? [String: Any] ?? ["Test details": "error"]
        
        let examID = chapterTestDetails["testId"] as? String ?? "Test ID error"
        let courseID = chapterTestDetails["courseId"] as? String ?? "Course ID error"
        let examName = chapterTestDetails["testName"] as? String ?? "Exam ID error"
        
        let eachTestDetails = ChapterTestDataModel(testID: examID, courseID: courseID, testName: examName)
        
        let questionsArray = jsonData!["questions"] as? [[String: Any]] ?? [["Test details": "error"]]
        
        for eachQuestion in questionsArray {
            
            let questionString = eachQuestion["question"] as? String ?? "No question received"
            let questionNumber = eachQuestion["questionNumber"] as? Int ?? 0
            let choices = eachQuestion["choices"] as? [String] ?? ["No choices"]
            
            let eachQuestion = QuestionDataModel(questionNumber: questionNumber, question: questionString, choices: choices)
            allQuestions.append(eachQuestion)
        }
        
        let chapterAndQuestions = QuestionAndAnswers(chapter: eachTestDetails, questions: allQuestions)
        return chapterAndQuestions
    }
    
    
    func userChapterQuestions(id: String, chapterNumber: Int, completionHandler: @escaping (_ questions: QuestionAndAnswers) -> Void) {
        
        let url = URL.fetchURLForChapterTest(id: id, chapterNumber: chapterNumber)
        
        manager.courseTest(url: url, completionHandler:
                            {
                                (json: Any) -> Void
                                in
                                let allQuestions = self.serializeQuestionsAndChoices(json: json)
                                completionHandler(allQuestions)
                            }
        )
    }
    
    func serializeUserAnswers(json: Any) -> UserMarkedAnswers{
        
        let jsonData = json as? [String: AnyObject]
        let testID = jsonData!["testId"] as? String ?? "Test ID error"
        let chapterNo = jsonData!["chapterNo"] as? Int ?? 0
        let scores = jsonData!["score"] as? Int ?? 0
        let totalQuestionNumbers = jsonData!["totalQuestions"] as? Int ?? 0
        
        let userMarkedAnswer = jsonData!["questions"] as? [[String: Any]] ?? [["user marked answers": "error"]]
        var allQuestionsArray = [Int]()
        var markedAnswesArray = [String]()
        
        for eachMarkedAnswer in userMarkedAnswer {
            
            let questionNo = eachMarkedAnswer["questionNumber"] as? Int ?? 0
            let userAnswer = eachMarkedAnswer["answer"] as? String ?? "No user answer"
            
            print(questionNo)
            print(userAnswer)
            
            allQuestionsArray.append(questionNo)
            markedAnswesArray.append(userAnswer)
        }
        let questionAnswer = Dictionary(uniqueKeysWithValues: zip(allQuestionsArray, markedAnswesArray))
        print(questionAnswer)
        let userAnswerdetails = UserMarkedAnswers(testID: testID, chapterNo: chapterNo, score: scores, totalQuestions: totalQuestionNumbers, markedAnswers: questionAnswer)
        
        return userAnswerdetails
    }
    
    func userMarkedAnswers(id: String, completionHandler: @escaping (_ answers: UserMarkedAnswers) -> Void) {
        
        let url = URL.fetchURLForUserMarkedAnswer(id: id)
        
        manager.courseTest(url: url, completionHandler:
                            {
                                (json: Any) -> Void
                                in
                                let allAnswers = self.serializeUserAnswers(json: json)
                                completionHandler(allAnswers)
                            }
        )
    }
    
    func serializeAnswerKeys(json: Any) -> AnswerKey{
        
        let jsonData = json as? [String: AnyObject]
        let testID = jsonData!["testId"] as? String ?? "Test ID error"
        let courseID = jsonData!["courseId"] as? String ?? "Course ID error"
        let testName = jsonData!["testName"] as? String ?? "Test name error"
        
        let allAnswerKey = jsonData!["questions"] as? [[String: Any]] ?? [["Answer key": "error"]]
        var allQuestionsArray = [Int]()
        var answerKeyArray = [String]()
        
        for eachAnswer in allAnswerKey {
            
            let questionNo = eachAnswer["questionNumber"] as? Int ?? 0
            let userAnswer = eachAnswer["answer"] as? String ?? "No user answer"
            
            print(questionNo)
            print(userAnswer)
            
            allQuestionsArray.append(questionNo)
            answerKeyArray.append(userAnswer)
        }
        let answerKey = Dictionary(uniqueKeysWithValues: zip(allQuestionsArray, answerKeyArray))
        print(answerKey)
        let answerKeyDetails = AnswerKey(testID: testID, courseID: courseID, testName: testName, realAnswers: answerKey)
        
        return answerKeyDetails
    }
    
    func userAnswerKey(testId: String, completionHandler: @escaping (_ answerKey: AnswerKey) -> Void) {
        
        let url = URL.fetchURLForAnswerKey(testId: testId)
        
        manager.courseTest(url: url, completionHandler:
                            {
                                (json: Any) -> Void
                                in
                                let allAnswerKey = self.serializeAnswerKeys(json: json)
                                completionHandler(allAnswerKey)
                            }
        )
    }
    
    func finalGrade(id: String, completionHandler: @escaping (_ grade: Double) -> Void) {
        
        let url = URL.fetchURLForFinalGrade(id: id)
        
        manager.courseGrade(url: url, completionHandler:
                            {
                                (json: Double) -> Void
                                in
                                
                                let grade = json
                                print(grade)
                                completionHandler(grade)
                            }
        )
    }
    
}
