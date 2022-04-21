//
//  ChoiceYourCourseViewController.swift
//  VirtualLearnApp
//
//  Created by Anusha on 21/04/22.
//

import UIKit

class ChoiceYourCourseViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var choiceCourseCategoryCollectionView: UICollectionView!
    @IBOutlet weak var choiceCourseAllCourseTableView: UITableView!
    
    let imageArray = [UIImage(named: "icn_categories_design"),UIImage(named: "icn_categories_developer"),UIImage(named: "icn_categories_business"),UIImage(named: "icn_categories_marketing"),UIImage(named: "icn_categories_photography"),UIImage(named: "icn_categories_finance"),UIImage(named: "icn_categories_IT"),UIImage(named: "icn_categories_lifestyle"),UIImage(named: "icn_categories_music"),UIImage(named: "icn_categories_teaching"),UIImage(named: "icn_categories_fitness")]
    
    let labelArray = [
        "Design",
        "Development",
        "Business",
        "Marketing",
        "Photography",
        "Finance",
        "IT&Software",
        "Lifestyle",
        "Music",
        "Teaching",
        "Health & Fitness"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        choiceCourseAllCourseTableView.delegate = self
        choiceCourseAllCourseTableView.dataSource = self
        
        choiceCourseCategoryCollectionView.delegate = self
        choiceCourseCategoryCollectionView.dataSource = self
        self.choiceCourseAllCourseTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
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
    
}

extension ChoiceYourCourseViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChoiceCourseCategoryCollectionViewCell", for: indexPath) as! ChoiceCourseCategoryCollectionViewCell
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 6
        cell.smallCategoryImage.image = imageArray[indexPath.row]
        cell.smallCategoryLabel.text = labelArray[indexPath.row]
        return cell
    }
    
}
