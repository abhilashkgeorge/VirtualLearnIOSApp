//
//  OngoingViewController.swift
//  VirtualLearnApp
//
//  Created by Anushree on 18/04/22.
//

import UIKit

class OngoingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var ongoingTable: UITableView!
    
    var courseList = [MyCoursesDataModel]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        ongoingTable.delegate = self
        ongoingTable.dataSource = self
        ongoingTable.alwaysBounceHorizontal = false
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
