//
//  HomeScreenTableViewCell.swift
//  VirtualLearnApp
//
//  Created by Abhilash k George on 11/04/22.
//

import UIKit

class HomeScreenTableViewCell: UITableViewCell {
    
    @IBOutlet weak var firstCollectionView: UICollectionView!
    @IBOutlet weak var secondCollectionView: UICollectionView!
    @IBOutlet weak var thirdCollectionView: UICollectionView!
    @IBOutlet weak var fourthCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureCells(indexPath: Int) {
        
        let flowLayout = UICollectionViewFlowLayout()
        
        if indexPath == 0 {
            self.firstCollectionView.setCollectionViewLayout(flowLayout, animated: false)
            self.firstCollectionView.delegate = self
            self.firstCollectionView.dataSource = self
            flowLayout.itemSize = CGSize(width: 260, height: 140)
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)
            flowLayout.scrollDirection = .horizontal
            
        } else if indexPath == 1 {
            self.secondCollectionView.setCollectionViewLayout(flowLayout, animated: false)
            self.secondCollectionView.delegate = self
            self.secondCollectionView.dataSource = self
            flowLayout.itemSize = CGSize(width: 120, height: 20)
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)
            flowLayout.scrollDirection = .horizontal
            
        } else if indexPath == 2 {
            self.thirdCollectionView.setCollectionViewLayout(flowLayout, animated: false)
            self.thirdCollectionView.delegate = self
            self.thirdCollectionView.dataSource = self
            flowLayout.itemSize = CGSize(width: 142, height: 138)
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)
            flowLayout.scrollDirection = .horizontal
            
        } else {
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
        if collectionView == firstCollectionView {
            return 2
        } else if collectionView == secondCollectionView {
            return 10
        }
        else if collectionView == thirdCollectionView {
            return 4
        } else {
            return 5
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == secondCollectionView {
            return 1
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == firstCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "firstCV", for: indexPath) as! HomeScreenCollectionViewCell
            if indexPath.row == 0 {
                cell.firstCVImg.image = UIImage(named: UIImage.AssetImages.Course1.rawValue)
                return cell
            } else {
                cell.firstCVImg.image = UIImage(named: UIImage.AssetImages.Course2.rawValue)
                return cell
            }
        } else if collectionView == secondCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "secondCV", for: indexPath) as! HomeScreenCollectionViewCell
            if indexPath.row == 0 {
                cell.secondCVBtn.setTitle("hello", for: .normal)
            } else {
                cell.secondCVBtn.setTitle("hi", for: .normal)
            }
            cell.secondCVBtn.layer.borderWidth = 1
            cell.secondCVBtn.layer.cornerRadius = 5
            cell.secondCVBtn.layer.borderColor = UIColor.gray.cgColor
            return cell
        }
        else if collectionView == thirdCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "thirdCV", for: indexPath) as! HomeScreenCollectionViewCell
                return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fourthCV", for: indexPath) as! HomeScreenCollectionViewCell
                return cell
        }
    }
    
    
}
