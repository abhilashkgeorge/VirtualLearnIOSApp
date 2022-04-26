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
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var job: UILabel!
    
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var occupation: UILabel!
    @IBOutlet weak var dob: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    var numberDetails = ["6", "102", "24"] {
        didSet {
            courseDetailsCollectionView.reloadData()
        }
    }
    
    var typeDetails = ["Courses", "Chapters", "Test"]
    var viewModel = ProfileViewModel()
    var profileModel: ProfileDataModel?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        courseDetailsCollectionView.delegate = self
        courseDetailsCollectionView.dataSource = self
        getDetails()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.privacyView.dropShadow(color: UIColor(red: 0, green: 0, blue: 0, alpha: 0.1), opacity: 0.5, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)
        privacyView.layer.borderColor = UIColor.clear.cgColor
        privacyView.layer.borderWidth = 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        configureNavigationBar()
    }
    func configureNavigationBar() {
        navigationController?.navigationBar.tintColor = .white
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(named: UIImage.AssetImages.SearchIcon.rawValue), style: .done, target: self, action: #selector(searchItemTapped))
        ]
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(image: UIImage(named: UIImage.AssetImages.HamburgerMenu.rawValue), style: .done, target: self, action: #selector(hamburgerButtonPressed))
        ]
    }
    
    @objc func searchItemTapped() {
        let searchStoryboard = UIStoryboard.init(name: "SearchStoryboard", bundle: Bundle.main)
        let searchVC = searchStoryboard.instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController
        self.navigationController?.pushViewController(searchVC!, animated: true)
    }
    
    @objc func hamburgerButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
    
    func getDetails() {
        
        
            
            guard let profileModel = self.profileModel else { return }
        
                self.name.text = profileModel.fullName
                self.job.text = profileModel.occupation
                self.fullName.text = profileModel.fullName
                self.userName.text = profileModel.userName
                self.email.text = profileModel.email
                self.phoneNumber.text = profileModel.mobileNumber
                self.occupation.text = profileModel.occupation
                self.dob.text = profileModel.dob
                self.profileImage.image = profileModel.profileImage
                self.numberDetails[0] = "\(profileModel.courses)"
                self.numberDetails[1] = "\(profileModel.chapters)"
                self.numberDetails[2] = "\(profileModel.tests)"
                
//                self.profileModel.fullName = profileModel.fullName
//                self.profileModel.userName = profileModel.userName
//                self.profileModel.profileImage = profileModel.profileImage
//                self.profileModel.email = profileModel.email
//                self.profileModel.mobileNumber = profileModel.mobileNumber
//                self.profileModel.occupation = profileModel.occupation
//                self.profileModel.dob = profileModel.dob
//                self.profileModel.gender = profileModel.gender
//                self.profileModel.twitterLink = profileModel.twitterLink
//                self.profileModel.facebookLink = profileModel.facebookLink
//                self.profileModel.courses = profileModel.courses
//                self.profileModel.chapters = profileModel.chapters
//                self.profileModel.tests = profileModel.tests
            }
    
    
    @IBAction func editProfileTapped(_ sender: Any) {
        guard let profileModel = self.profileModel else { return }
        let editProfileVc = storyboard?.instantiateViewController(withIdentifier: "EditProfileViewController") as? EditProfileViewController
        editProfileVc?.profileDetails = profileModel
        editProfileVc?.detailModification = self
        self.navigationController?.pushViewController(editProfileVc!, animated: true)
    }
    
    @IBAction func changePasswordButtonTapped(_ sender: Any) {
        
        let changePasswordVc = storyboard?.instantiateViewController(withIdentifier: "ChangePasswordViewController") as? ChangePasswordViewController
        self.navigationController?.pushViewController(changePasswordVc!, animated: true)
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

extension ProfileViewController: Details {
    
    func passDetails(email: String, job: String, dob: String) {
        self.email.text = email
        self.occupation.text = job
        self.dob.text = dob
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

