//
//  CompletedViewController.swift
//  VirtualLearnApp
//
//  Created by Anushree on 18/04/22.
//

import UIKit

class CompletedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var completedTable: UITableView!
    
    var courseList = [MyCoursesDataModel]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        completedTable.delegate = self
        completedTable.dataSource = self
        completedTable.alwaysBounceHorizontal = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return courseList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = completedTable.dequeueReusableCell(withIdentifier: CompletedTableViewCell.identifier, for: indexPath) as! CompletedTableViewCell
        cell.completedCourseImage.layer.cornerRadius = 6
        cell.completedCourseImage.image = courseList[indexPath.row].courseImage
        cell.completedCourseName.text = courseList[indexPath.row].courseName
        cell.certificate.layer.cornerRadius = 3.4
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155
    }

}
