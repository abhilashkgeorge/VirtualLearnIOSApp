//
//  OverviewScreenController.swift
//  VirtualLearnApp
//
//  Created by Abhilash k George on 19/04/22.
//

import UIKit

class OverviewScreenController: UIViewController {

    
    let courseIdentifier = "course"
    let LearnIdentifier = "learn"
    let requirementsIdentifier = "requirements"
    
    
    //MARK: Table View Outlets
    @IBOutlet weak var courseTableView: UITableView!
    @IBOutlet weak var learnTableView: UITableView!
    @IBOutlet weak var requirementsTableView: UITableView!
    
    //MARK: Overview Outlets
    @IBOutlet weak var overViewTitle: UILabel!
    @IBOutlet weak var overViewDescription: UILabel!
    
    
    
    //MARK: Instructor
    @IBOutlet weak var instructorName: UILabel!
    @IBOutlet weak var instructorOccupation: UILabel!
    @IBOutlet weak var instructorDescription: UILabel!
    
    //MARK: Button
    @IBOutlet weak var joinCourseButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        courseTableView.delegate = self
        courseTableView.dataSource = self
        
        learnTableView.delegate = self
        learnTableView.dataSource = self

        requirementsTableView.delegate = self
        requirementsTableView.dataSource = self
        

        // Do any additional setup after loading the view.
    }
}

extension OverviewScreenController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == courseTableView {
            return 2
        } else if tableView == learnTableView {
            return 5
        } else  {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == courseTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: courseIdentifier) as! OverviewCourseTableViewCell
            return cell
        } else if tableView == learnTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: LearnIdentifier) as! OverviewLearnTableViewCell
            return cell
        } else  if tableView == requirementsTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: requirementsIdentifier) as! OverViewRequirementsTableViewCell
            return cell
        } else {
            return UITableViewCell()
     
    }
    
    
}
}
