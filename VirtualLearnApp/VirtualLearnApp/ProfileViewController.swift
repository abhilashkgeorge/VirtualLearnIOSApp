//
//  ProfileViewController.swift
//  VirtualLearnApp
//
//  Created by Anushree on 11/04/22.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var courseDetailsCollectionView: UICollectionView!
    @IBOutlet weak var privacyView: UIView!
    
    var numberDetails = ["6", "102", "24"]
    var typeDetails = ["Courses", "Chapters", "Test"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        courseDetailsCollectionView.delegate = self
        courseDetailsCollectionView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
        self.privacyView.dropShadow(color: UIColor(red: 0, green: 0, blue: 0, alpha: 0.1), opacity: 0.5, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)
        privacyView.layer.borderColor = UIColor.clear.cgColor
        privacyView.layer.borderWidth = 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberDetails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = courseDetailsCollectionView.dequeueReusableCell(withReuseIdentifier: "CourseCell", for: indexPath) as! CoursesDetailsCollectionViewCell
        cell.numberInformation.text = numberDetails[indexPath.item]
        cell.typeInformation.text = typeDetails[indexPath.item]
        return cell
    }
    
    @IBAction func editProfileTapped(_ sender: Any) {
        
        let editProfileVc = storyboard?.instantiateViewController(withIdentifier: "EditProfileViewController") as? EditProfileViewController
        self.navigationController?.pushViewController(editProfileVc!, animated: true)
    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

    let collectionWidth = courseDetailsCollectionView.bounds.width
    return CGSize(width: collectionWidth/3, height: collectionWidth/3)

}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
}
}

extension UIView {

func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
self.layer.masksToBounds = false
self.layer.shadowColor = color.cgColor
self.layer.shadowOpacity = opacity
self.layer.shadowOffset = offSet
self.layer.shadowRadius = radius
self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
self.layer.shouldRasterize = true
self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
}
}

