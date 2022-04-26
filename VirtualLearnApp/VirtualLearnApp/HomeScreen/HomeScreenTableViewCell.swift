//
//  HomeScreenTableViewCell.swift
//  VirtualLearnApp
//
//  Created by Abhilash k George on 11/04/22.
//

import UIKit
import Foundation

protocol HomeScreenNavigationDelegate: AnyObject {
    func didSelectCategorySeeAllButton()
    func didSelectCoursesSeeAllButton()
}
protocol NavigationDelegate: AnyObject {
    func didSelectItem(courseName: String, courseId: String, courseCategory: String, courseImage: UIImage, numberOfChapters: Int)
}

class HomeScreenTableViewCell: UITableViewCell {

    @IBOutlet weak var firstCollectionView: UICollectionView!
    @IBOutlet weak var secondCollectionView: UICollectionView!
    @IBOutlet weak var thirdCollectionView: UICollectionView!
    @IBOutlet weak var fourthCollectionView: UICollectionView!
    @IBOutlet weak var thirdTBCellAllBtn: UIButton!
    @IBOutlet weak var thirdTBCellPopularBtn: UIButton!
    @IBOutlet weak var thirdTBCellNewestBtn: UIButton!
    @IBOutlet weak var fourthCellHeaderLbl: UILabel!
    
    
    weak var  navigationDelegate: NavigationDelegate?
    weak var delegate: HomeScreenNavigationDelegate?
    
    var homeScreenTV: UITableView?
    
    var allButtonStatus:Bool = true
    var popularButtonStatus:Bool = false
    var newestButtonStatus:Bool = false
    
    
    
    var collectionView: UICollectionView?
    
    var allCourses: [HomeModel]?


    
    var viewModel: HomeViewModel = HomeViewModel()
    
    
    var categoryTitles = ["Design",
                          "Development",
                          "Business",
                          "Marketing",
                          "Photography",
                          "Finance",
                          "IT&Software",
                          "Lifestyle",
                          "Music",
                          "Teaching",
                          "Health & Fitness"]
    
    
    var categoryTopCourses = [String]()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func categoriesSeeAllButtonTapped(_ sender: Any) {
        delegate?.didSelectCategorySeeAllButton()
    }
    
    @IBAction func courseSeeAllButtonTapped(_ sender: Any) {
        delegate?.didSelectCoursesSeeAllButton()
    }
    @IBAction func thirdTBCellAllBtnTapped(_ sender: Any) {
        
        guard let homeScreenTV = homeScreenTV else {
            return
        }
        allButtonStatus = true
        popularButtonStatus = false
        newestButtonStatus = false
        thirdTBCellAllBtn.setTitleColor(.textBlue, for: .normal)
        thirdTBCellAllBtn.backgroundColor = .buttonGreyBackground
        thirdTBCellPopularBtn.backgroundColor = .clear
        thirdTBCellPopularBtn.setTitleColor(.customGrey, for: .normal)
        homeScreenTV.reloadData()
    }
    
    @IBAction func thirdTBCellPopularBtnTapped(_ sender: Any) {
        guard let homeScreenTV = homeScreenTV else {
            return
        }
        allButtonStatus = false
        popularButtonStatus = true
        newestButtonStatus = false
        
        thirdTBCellPopularBtn.setTitleColor(.textBlue, for: .normal)
        thirdTBCellPopularBtn.backgroundColor = .buttonGreyBackground
        thirdTBCellAllBtn.backgroundColor = .clear
        thirdTBCellAllBtn.setTitleColor(.customGrey, for: .normal)
        homeScreenTV.reloadData()
    }
    @IBAction func thirdTBCellNewestBtnTapped(_ sender: Any) {
        guard let homeScreenTV = homeScreenTV else {
            return
        }
        allButtonStatus = false
        popularButtonStatus = false
        newestButtonStatus = true
        homeScreenTV.reloadData()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
   
    
    func configureCells(indexPath: Int) {
        
        let flowLayout = UICollectionViewFlowLayout()
        
        if indexPath == 0 {
            self.firstCollectionView.reloadData()
            self.firstCollectionView.setCollectionViewLayout(flowLayout, animated: false)
            self.firstCollectionView.delegate = self
            self.firstCollectionView.dataSource = self
            flowLayout.itemSize = CGSize(width: 260, height: 140)
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)
            flowLayout.scrollDirection = .horizontal
            
        } else if indexPath == 1 {
            self.secondCollectionView.reloadData()
            self.secondCollectionView.setCollectionViewLayout(flowLayout, animated: false)
            self.secondCollectionView.delegate = self
            self.secondCollectionView.dataSource = self
            flowLayout.itemSize = CGSize(width: 165, height: 25)
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)
            flowLayout.scrollDirection = .horizontal
            
        } else if indexPath == 2 {
            self.thirdCollectionView.reloadData()
            self.thirdCollectionView.setCollectionViewLayout(flowLayout, animated: false)
            self.thirdCollectionView.delegate = self
            self.thirdCollectionView.dataSource = self
            flowLayout.itemSize = CGSize(width: 142, height: 138)
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)
            flowLayout.scrollDirection = .horizontal
            
        } else  {
            self.fourthCollectionView.reloadData()
            self.fourthCollectionView.setCollectionViewLayout(flowLayout, animated: false)
            self.fourthCollectionView.delegate = self
            self.fourthCollectionView.dataSource = self
            flowLayout.itemSize = CGSize(width: 289, height: 229)
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)
            flowLayout.scrollDirection = .horizontal
        }
    }
}

extension HomeScreenTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard  let allCourses = allCourses else {
            return 5
        }
        if collectionView == firstCollectionView {
            return allCourses.count
        } else if collectionView == secondCollectionView {
            return categoryTitles.count
        } else if collectionView == thirdCollectionView {
            return allCourses.count
        } else {
            return allCourses.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let allCourses = allCourses else {
            return UICollectionViewCell()
        }
        let categoriesImages = [ UIImage(named:"icn_categories_design"),UIImage(named:"icn_categories_developer"),UIImage(named:"icn_categories_business"),UIImage(named:"icn_categories_marketing"),UIImage(named:"icn_categories_photography"),UIImage(named:"icn_categories_finance"),UIImage(named:"icn_categories_IT"), UIImage(named:"icn_categories_lifestyle"),UIImage(named:"icn_categories_music"),  UIImage(named:"icn_categories_fitness"),                                 UIImage(named:"icn_categories_teaching")
        ]
               
        
        if collectionView == firstCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "firstCV", for: indexPath) as! HomeScreenCollectionViewCell
            if indexPath.row == 0 {
                cell.firstCVImg.image = allCourses[indexPath.item].courseImage
                return cell
            } else {
                cell.firstCVImg.image = allCourses[indexPath.item].courseImage
                return cell
            }
            
        }
         else if collectionView == secondCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "secondCV", for: indexPath) as! HomeScreenCollectionViewCell
            
            for item in 0...categoryTitles.count - 1
            {
                if indexPath.row == item {
                    cell.secondCVBtn.setImage(categoriesImages[item], for: .normal)
                    cell.secondCVBtn.setTitle(categoryTitles[item], for: .normal)
                }
                
            }
            cell.secondCVBtn.layer.borderWidth = 1
            cell.secondCVBtn.layer.cornerRadius = 5
            cell.secondCVBtn.layer.borderColor = UIColor.gray.cgColor
            return cell
        }
        else if collectionView == thirdCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "thirdCV", for: indexPath) as! HomeScreenCollectionViewCell
            cell.thirdCVImg.image = allCourses[indexPath.item].courseImage
            cell.thirdCVlbl.text = allCourses[indexPath.item].courseTitle
            cell.tagLbl.text  = allCourses[indexPath.item].courseCategory
            cell.thirdCVLbl2.text = "\(allCourses[indexPath.item].noOfChapters) Chapter"
            return cell
                   
        } else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fourthCV", for: indexPath) as! HomeScreenCollectionViewCell
            cell.fourthCVImg.image = allCourses[indexPath.item].courseImage
            cell.fourthCVTime.text = allCourses[indexPath.item].courseCategory
            cell.fourthCVTitle.text = allCourses[indexPath.item].courseTitle
            cell.fourthCVChapterNumber.text = "\(allCourses[indexPath.item].noOfChapters)"
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == firstCollectionView {
            
          //  let overviewVC = 
          
            
        }
         else if collectionView == secondCollectionView {
           
                
            
         
        }
        else if collectionView == thirdCollectionView {
            guard let allCourses = allCourses else {
                print("The course count in all courses is Zero")
                return
            }
            for item in 0...allCourses.count {
                
                if item == indexPath.item {
                    navigationDelegate?.didSelectItem(courseName: allCourses[item].courseTitle, courseId: allCourses[item].id, courseCategory: allCourses[item].courseCategory, courseImage: allCourses[item].courseImage, numberOfChapters: allCourses[item].noOfChapters)
                    print(allCourses[item].courseTitle)
                } 
                
            }
            
           
                   
        } else {
            
        }
    }
    
}
