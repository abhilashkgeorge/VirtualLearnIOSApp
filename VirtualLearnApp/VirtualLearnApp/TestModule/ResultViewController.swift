//
//  ResultViewController.swift
//  VirtualLearnApp
//
//  Created by Prajna P on 27/04/22.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var chapterNumberView: UIView!
    @IBOutlet weak var collectiveResultView: UIView!
    @IBOutlet weak var testResultTableView: UITableView!
    
    var questions = [Question]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testResultTableView.delegate = self
        testResultTableView.dataSource = self
        collectiveResultViewUI()
        chapterNumberViewUI()
        getQuestions()
        testResultTableView.separatorStyle = .none
    }
    
    
    func getQuestions() {
        questions.append(Question(questionNumber: 1, question: "What is value of 4+6", choices: ["10","55","10","4"], correctAnswer: "10"))
        questions.append(Question(questionNumber: 2, question: "What is value of 5+5", choices: ["10","5","7","4"], correctAnswer: "10"))
        
        
    }
    
    func collectiveResultViewUI() {
        collectiveResultView.layer.cornerRadius = 6
        
        collectiveResultView.layer.shadowColor = UIColor.shadowGreyBackground.cgColor
        collectiveResultView.layer.shadowOpacity = 0.2
        collectiveResultView.layer.shadowRadius = 3
        collectiveResultView.layer.shadowOffset = .zero
    }


    func chapterNumberViewUI() {
        chapterNumberView.layer.cornerRadius = 3.9
    }
    

}

extension ResultViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let question = questions[indexPath.row]
        let vc2 = testResultTableView.dequeueReusableCell(withIdentifier: "questionResultCell") as! QuestionResultCell
        vc2.questionNo.text = question.question
        vc2.questionResult.text = question.correctAnswer
        return vc2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
}

