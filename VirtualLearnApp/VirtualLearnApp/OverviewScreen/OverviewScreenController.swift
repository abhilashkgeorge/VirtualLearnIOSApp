//
//  OverviewScreenController.swift
//  VirtualLearnApp
//
//  Created by Abhilash k George on 19/04/22.
//

import UIKit
import AVFoundation

class OverviewScreenController: UIViewController {

    
    let courseIdentifier = "course"
    let LearnIdentifier = "learn"
    
    var courseName  = ""
    var courseID = ""
    let requirementsIdentifier = "requirements"
    var imageArray = [
        UIImage(named:"icn_includes_certificate"),
        UIImage(named:"icn_includes_duration"),
        UIImage(named:"icn_includes_lifetime"),
        UIImage(named:"icn_includes_supportfiles"),
        UIImage(named:"icn_includes_test"),
        UIImage(named:"icn_includes_test"),
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
    @IBOutlet weak var instructorImage: UIImageView!
    
    //MARK: Button
    @IBOutlet weak var joinCourseButton: UIButton!
    
    var playerLayer = AVPlayerLayer()
    
    var overviewViewModel = OverviewViewModel()
    var joinCourseViewModel = JoinCourseViewModel()
    var overviewData: OverviewDataModel? {
        didSet {
            self.courseTableView.reloadData()
        }
    }
    

    @IBAction func joinCourseBtnTapped(_ sender: Any) {
        joinCourseViewModel.joiningNewCourse(name: courseName, id: courseID) { (message) in
            print("sucess")
            DispatchQueue.main.async {
                self.joinCourseButton.isHidden = true
                
            }
           
        }
        
    }
    override func viewDidLoad() {
        getOverviewDetails(name: courseName, id: courseID)
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
                self.overviewData = details
                self.configureView()
                self.courseTableView.reloadData()
                self.learnTableView.reloadData()
                self.requirementsTableView.reloadData()
            }

        })

        }
    
    func configureView() {
        
        guard let overviewData = overviewData else {
            return
        }
        
        learnTableView.alwaysBounceVertical = false
        requirementsTableView.alwaysBounceVertical = false
        courseTableView.alwaysBounceVertical = false
        

             
        courseTableView.estimatedRowHeight = 120
        courseTableView.rowHeight = UITableView.automaticDimension


        overViewTitle.text = overviewData.overViewTitle
        overViewDescription.text = overviewData.description
        instructorName.text = overviewData.instructorName
        instructorOccupation.text = overviewData.occupation
        instructorDescription.text = overviewData.instructorDetails
        instructorImage.image = overviewData.profileImg
    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
        
        let videoURl = URL(string: "https://youtu.be/88PXJAA6szs")
        let player = AVPlayer(url: videoURl!)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        playerLayer.videoGravity = .resizeAspect
        self.view.layer.addSublayer(playerLayer)
        player.play()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        playerLayer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    }
    
}

extension OverviewScreenController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let overviewData = overviewData else {
            return 15
        }
        if tableView == courseTableView {
            return (overviewData.courseIncludes.count)
        } else if tableView == learnTableView {
            return overviewData.learn.count
        } else  {
            return overviewData.requirements.count
        }
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 18
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let overviewData = overviewData else {
            return UITableViewCell()
        }
        if tableView == courseTableView {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: courseIdentifier) as! OverviewCourseTableViewCell
            cell.firstTBLbl.text = overviewData.courseIncludes[indexPath.row]
            cell.firstTBImage.image = imageArray[indexPath.row]
            return cell
        } else if tableView == learnTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: LearnIdentifier) as! OverviewLearnTableViewCell
            cell.secondTBLbl.text = overviewData.learn[indexPath.row]
            return cell
        } else  if tableView == requirementsTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: requirementsIdentifier) as! OverViewRequirementsTableViewCell
            cell.thirdTBLbl.text = overviewData.requirements[indexPath.row]
            return cell
        } else {
            return UITableViewCell()
     
    }
    
    
}
    
}

