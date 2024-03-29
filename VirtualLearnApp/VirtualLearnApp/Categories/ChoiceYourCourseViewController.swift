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
    
    var userAllCourses = [HomeModel]()

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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userAllCourses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChoiceCourseAllCourseTableViewCell", for: indexPath) as! ChoiceCourseAllCourseTableViewCell
        cell.setStyling()
        cell.tableCourseName.text = userAllCourses[indexPath.row].courseTitle
        cell.tableCategory.text = userAllCourses[indexPath.row].courseCategory
        cell.tableChapters.text = "\(userAllCourses[indexPath.row].noOfChapters)" + " Chapters"
        cell.tableImage.image = userAllCourses[indexPath.row].courseImage
        
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
