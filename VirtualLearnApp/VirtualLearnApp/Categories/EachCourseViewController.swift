//
//  EachCourseViewController.swift
//  VirtualLearnApp
//
//  Created by Anusha on 21/04/22.
//

import UIKit

class EachCourseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var categoryTitle: CustomHeaderLabel!
    @IBOutlet weak var allCourse: UITableView!
    @IBOutlet weak var subCategories: UICollectionView!
    @IBOutlet weak var featuredCourses: UICollectionView!
    @IBOutlet weak var coursesToGetStarted: UICollectionView!
    
    var allCourses = [HomeModel]()
    var filteredArray = [HomeModel]()
    var selectedCategory = ""
    
    var subCatArray = ["Graphic Design","UI Design","Product design","Interior Design","Motion Design","2D Design","Web Design","Web Design"]
    var courseImgArray = [UIImage(named: "img_course2_bg"),UIImage(named: "img_course2_bg")]
    var courseHeadingArray = ["Complete Blender Creator: Learn 3D Modelling for Beginners","UI Design Product design"]
    var courseChapArray = ["15 Chapters","16 Chapters"]
    var courseDurationArray = ["1:30:20","1:30:20"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTitle.text = selectedCategory
        self.allCourse.separatorStyle = UITableViewCell.SeparatorStyle.none
        subCategories.delegate = self
        subCategories.dataSource = self
        
        featuredCourses.delegate = self
        featuredCourses.dataSource = self
        
        coursesToGetStarted.delegate = self
        coursesToGetStarted.dataSource = self
        configureNavigationBar()
    }
    
    func configureNavigationBar() {
        
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(image: UIImage(named: UIImage.AssetImages.backButton.rawValue), style: .plain, target: self, action: #selector(backBtnTapped))
        ]
    }
    
    @objc func backBtnTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCourses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChoiceCourseAllCourseTableViewCell", for: indexPath) as! ChoiceCourseAllCourseTableViewCell
        cell.setStyling()
        cell.tableCourseName.text = allCourses[indexPath.row].courseTitle
        cell.tableCategory.text = allCourses[indexPath.row].courseCategory
        cell.tableChapters.text = "\(allCourses[indexPath.row].noOfChapters)" + "Chapter"
        cell.tableImage.image = allCourses[indexPath.row].courseImage
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
            return filteredArray.count
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
            cell.courseImg.image = filteredArray[indexPath.row].courseImage
            cell.courseHeading.text = filteredArray[indexPath.row].courseTitle
            cell.courseChap.text = "\(filteredArray[indexPath.row].noOfChapters)" + " Chapters"
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
