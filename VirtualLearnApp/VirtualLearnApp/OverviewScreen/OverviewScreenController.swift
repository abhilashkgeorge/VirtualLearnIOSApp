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
    var imageArray = [
        UIImage(named:"icn_includes_certificate"),
        UIImage(named:"icn_includes_duration"),
        UIImage(named:"icn_includes_lifetime"),
        UIImage(named:"icn_includes_supportfiles"),
        UIImage(named:"icn_includes_test")]
    

    
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
    
    var overviewViewModel = OverviewViewModel()
    
    var overviewData = [OverviewDataModel]() {
        didSet {
            self.courseTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        getOverviewDetails(name: "Angular", id: "621712f90ddbaf905504874b")
        super.viewDidLoad()
        
        courseTableView.delegate = self
        courseTableView.dataSource = self
        
        learnTableView.delegate = self
        learnTableView.dataSource = self

        requirementsTableView.delegate = self
        requirementsTableView.dataSource = self
   // Do any additional setup after loading the view.
    }
    
    func getOverviewDetails(name: String, id: String) {

        overviewViewModel.userCourseOverview(name: name, id: id, completionHandler: {

            (_ details: OverviewDataModel) -> Void
            in
            DispatchQueue.main.async {
                self.overviewData = [details]
                print("989389898989898")
                print(self.overviewData[0].description)
                self.configureView()
                self.courseTableView.reloadData()
            }

        })

        }
    
    func configureView() {

        overViewTitle.text = overviewData[0].overViewTitle
        overViewDescription.text = overviewData[0].description
        instructorName.text = overviewData[0].instructorName
        instructorOccupation.text = overviewData[0].occupation
        instructorDescription.text = overviewData[0].instructorDetails
    }
}

extension OverviewScreenController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == courseTableView {
            return overviewData.count
        } else if tableView == learnTableView {
            return 5
        } else  {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == courseTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: courseIdentifier) as! OverviewCourseTableViewCell
            cell.firstTBLbl.text = overviewData[indexPath.row].courseIncludes[indexPath.row]
            cell.firstTBImage.image = imageArray[indexPath.row]
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
