//
//  EachCourseViewController.swift
//  VirtualLearnApp
//
//  Created by Anusha on 21/04/22.
//

import UIKit

class EachCourseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var allCourse: UITableView!
    @IBOutlet weak var subCategories: UICollectionView!
    @IBOutlet weak var featuredCourses: UICollectionView!
    @IBOutlet weak var coursesToGetStarted: UICollectionView!
    
    var subCatArray = ["Graphic Design","UI Design","Product design","Interior Design","Motion Design","2D Design","Web Design","Web Design"]
    var courseImgArray = [UIImage(named: "img_course2_bg"),UIImage(named: "img_course2_bg")]
    var courseHeadingArray = ["Complete Blender Creator: Learn 3D Modelling for Beginners","UI Design Product design"]
    var courseChapArray = ["15 Chapter","16 Chapter"]
    var courseDurationArray = ["1:30:20","1:30:20"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.allCourse.separatorStyle = UITableViewCell.SeparatorStyle.none
        subCategories.delegate = self
        subCategories.dataSource = self
        
        featuredCourses.delegate = self
        featuredCourses.dataSource = self
        
        coursesToGetStarted.delegate = self
        coursesToGetStarted.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChoiceCourseAllCourseTableViewCell", for: indexPath) as! ChoiceCourseAllCourseTableViewCell
        cell.setStyling()
        cell.tableCourseName.text = "User Interface Design Essentials - UI/UX Design"
        cell.tableCategory.text = "Development"
        cell.tableChapters.text = "2" + " Chapters"
        cell.tableImage.image = #imageLiteral(resourceName: "img_serach result1")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.subCategories {
            return subCatArray.count
        }
        else if collectionView == self.coursesToGetStarted {
            return 2
        }
        else {
            return 2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.subCategories {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubCategoryCollectionViewCell", for: indexPath) as! SubCategoryCollectionViewCell
            cell.layer.borderColor = UIColor.gray.cgColor
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 6
            cell.subCategory.text = subCatArray[indexPath.row]
            return cell
            
        }
        else if collectionView == self.coursesToGetStarted {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoursesCollectionViewCell", for: indexPath) as! CoursesCollectionViewCell
            cell.courseImg.image = courseImgArray[indexPath.row]
            cell.courseHeading.text = courseHeadingArray[indexPath.row]
            cell.courseChap.text = courseChapArray[indexPath.row]
            cell.courseDuration.text = courseDurationArray[indexPath.row]
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoursesCollectionViewCell", for: indexPath) as! CoursesCollectionViewCell
            cell.courseImg.image = courseImgArray[indexPath.row]
            cell.courseHeading.text = courseHeadingArray[indexPath.row]
            cell.courseChap.text = courseChapArray[indexPath.row]
            cell.courseDuration.text = courseDurationArray[indexPath.row]
            return cell
        }
    }
}
