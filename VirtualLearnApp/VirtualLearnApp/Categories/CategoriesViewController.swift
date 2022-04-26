//
//  CategoriesViewController.swift
//  VirtualLearnApp
//
//  Created by Anusha on 20/04/22.
//

import UIKit

class CategoriesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    let imageArray = [UIImage(named: "icn_categories_design"),UIImage(named: "icn_categories_developer"),UIImage(named: "icn_categories_business"),UIImage(named: "icn_categories_marketing"),UIImage(named: "icn_categories_photography"),UIImage(named: "icn_categories_finance"),UIImage(named: "icn_categories_IT"),UIImage(named: "icn_categories_lifestyle"),UIImage(named: "icn_categories_music"),UIImage(named: "icn_categories_teaching"),UIImage(named: "icn_categories_fitness")]
    
    var categoryAllCourses = [HomeModel]()
    
    var categoryPopularCourses = [HomeModel]()
    
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
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as! CategoriesCollectionViewCell
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 6
        cell.categoryImage.image = imageArray[indexPath.row]
        cell.categoryLabel.text = labelArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let title = labelArray[indexPath.row]
 
        
        let eachCourseVc = storyboard?.instantiateViewController(withIdentifier: "EachCourseViewController") as? EachCourseViewController
        eachCourseVc?.selectedCategory = title
        eachCourseVc?.allCourses = categoryAllCourses
        eachCourseVc?.filteredArray = categoryPopularCourses.filter({$0.courseCategory == title})
        self.navigationController?.pushViewController(eachCourseVc!, animated: true)
    }
}
