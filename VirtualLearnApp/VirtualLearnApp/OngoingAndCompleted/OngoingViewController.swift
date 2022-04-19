//
//  OngoingViewController.swift
//  VirtualLearnApp
//
//  Created by Anushree on 18/04/22.
//

import UIKit

class OngoingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var ongoingTable: UITableView!
    
    var viewModel = MyCoursesViewModel()
    
    var courseList = [MyCoursesDataModel]() {
        didSet {
            ongoingTable.reloadData()
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        getCoursesList()
        ongoingTable.delegate = self
        ongoingTable.dataSource = self
    }
    
    func getCoursesList() {
        
        viewModel.ongoingUserCourses(completionHandler: {
            
            (_ profile: [MyCoursesDataModel]) -> Void
            in
            DispatchQueue.main.async {
                self.courseList = profile
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return courseList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = ongoingTable.dequeueReusableCell(withIdentifier: OngoingTableViewCell.identifier, for: indexPath) as! OngoingTableViewCell
        cell.ongoingCourseImage.layer.cornerRadius = 6
        cell.ongoingCourseImage.image = courseList[indexPath.row].courseImage
        cell.ongoingCourseName.text = courseList[indexPath.row].courseName
        cell.continue.layer.cornerRadius = 3.4
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155
    }
    
}
