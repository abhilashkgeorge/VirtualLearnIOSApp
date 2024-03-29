//
//  HomeScreenViewController.swift
//  VirtualLearnApp
//
//  Created by Abhilash k George on 12/04/22.
//


import UIKit
class HomeScreenViewController: UIViewController {
    
    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
    @IBOutlet weak var sideMenuView: UIView!
    @IBOutlet weak var homeScreenTableview: UITableView!
    @IBOutlet weak var coverImg: UIImageView!
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var occupationhamburgerLbl: UILabel!
    @IBOutlet weak var hamburgerNameLbl: UILabel!
    //MARK: Hamburger Buttons
    
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var myCourse: UIButton!
    @IBOutlet weak var myProfile: UIButton!
    @IBOutlet weak var notification: UIButton!
    @IBOutlet weak var setting: UIButton!
    @IBOutlet weak var logout: UIButton!
    
    
    var viewModel = HomeViewModel()
    var profileViewModel = ProfileViewModel()
    var myCoursesViewModel = MyCoursesViewModel()
    var testViewModel = ChapterTestViewModel()
    
    var profileData = [ProfileDataModel]()
    var allCourses = [HomeModel]()
    var popularCourses = [HomeModel]()
    var ongoingCourses = [MyCoursesDataModel]()
    var completedCourses = [MyCoursesDataModel]()
    var userLogout = Logout()
    var hamburgerStatus = false
    var ongoingCount = 0
    var nameString: String? {
        didSet {
            homeScreenTableview.reloadData()
        }
    }
    var categoryTopCourses : Set<String> = []
    var sortedCategory: [String] = ["Design", "Development", "Photography", "Lifestyle"]
    @IBOutlet weak var hamburgerView: UIView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.homeScreenTableview.separatorStyle = .none
        configureNavigationBar()
        homeScreenTableview.delegate = self
        homeScreenTableview.dataSource = self
        getAllCourses()
        getPopularCourses()
        getProfileDetails()
        getOngoingCourses()
        getCompletedCourses()
        homeButton.imageWith(color: .hamburgerGrey, for: .normal)
    }
    
    func getProfileDetails() {
        
        profileViewModel.myProfile { (ProfileDataModel) in
            DispatchQueue.main.async {
                
                self.profileData = [ProfileDataModel]
                self.hamburgerNameLbl.text = ProfileDataModel.fullName
                self.nameString = ProfileDataModel.fullName
                self.occupationhamburgerLbl.text = ProfileDataModel.occupation
                self.profileImage.image = ProfileDataModel.profileImage
                
            }

        }
    }
    
    func getAllCourses() {
        
        viewModel.homeScreenAllCourses(completionHandler: {
            
            (_ courses: [HomeModel]) -> Void
            in
            DispatchQueue.main.async {
                self.allCourses = courses
                self.homeScreenTableview.reloadData()
            }
        })
        
    }
    func getPopularCourses() {
        
        viewModel.homeScreenPopularCourses(completionHandler: {
            
            (_ courses: [HomeModel]) -> Void
            in
            DispatchQueue.main.async {
                self.popularCourses = courses
                for item in 0...courses.count - 1 {
                    self.categoryTopCourses.insert(courses[item].courseCategory)
                    self.sortedCategory = self.categoryTopCourses.sorted(by: <)
                }
                self.homeScreenTableview.reloadData()
            }
        })
        
    }
    
    func getOngoingCourses() {
        
        myCoursesViewModel.ongoingUserCourses(completionHandler: {
            
            (_ profile: [MyCoursesDataModel]) -> Void
            in
            DispatchQueue.main.async {
                self.ongoingCourses = profile
                self.ongoingCount = profile.count
            }
        })
    }
    
    func getCompletedCourses() {
        
        myCoursesViewModel.completedUserCourses(completionHandler: {
            
            (_ profile: [MyCoursesDataModel]) -> Void
            in
            DispatchQueue.main.async {
                self.completedCourses = profile
            }
        })
    }
    
    
    func configureNavigationBar() {
        navigationController?.navigationBar.tintColor = .white
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(named: UIImage.AssetImages.SearchIcon.rawValue), style: .done, target: self, action: #selector(searchItemTapped))
        ]
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(image: UIImage(named: UIImage.AssetImages.HamburgerMenu.rawValue), style: .done, target: self, action: #selector(hamburgerButtonPressed))
        ]
        
        if hamburgerStatus == true {
            sideMenuConstraint.constant = -350
            animateView()
        }
    }
    
    func getCategoryAllCourse() {
        
        viewModel.homeScreenAllCourses(completionHandler: {
            
            (_ courses: [HomeModel]) -> Void
            in
            DispatchQueue.main.async {
                self.allCourses = courses
            }
        })
        
    }
    
    func getCategoryPopularCourses() {
        
        viewModel.homeScreenPopularCourses(completionHandler: {
            
            (_ courses: [HomeModel]) -> Void
            in
            DispatchQueue.main.async {
                self.popularCourses = courses
            }
        })
        
    }
    
    
    //MARK: Hamburger Button Tapped
    
    @IBAction func homeBtnTapped(_ sender: Any) {
        
        homeButton.tintColor = UIColor.white
        sideMenuConstraint.constant = 0
        animateView()
        configureNavigationBar()
//        testViewModel.userAnswerKey(testId: "6231b26573a9ff43ed8fc056") { (AnswerKey) in
//            print("answer key")
//        }
        
//        testViewModel.userMarkedAnswers(id: "62274ebff5a5db4553d89454") { (UserMarkedAnswers) in
//            print("marked answers")
//        }
        
        testViewModel.finalGrade(id: "62274ebff5a5db4553d89454") { (Double) in
            print("grade!!!")
        }
    }
    
    
    @IBAction func myCourseBtn(_ sender: Any) {
        
        myCourse.imageWith(color: .red, for: .normal)
        let myCoursesStoryboard = UIStoryboard.init(name: "MyCourses", bundle: Bundle.main)
        if ongoingCount == 0 {
            
            let myCoursesVC = myCoursesStoryboard.instantiateViewController(withIdentifier: "EmptyCourseViewController") as? EmptyCourseViewController
            self.navigationController?.pushViewController(myCoursesVC!, animated: true)
        } else {
            
            let myCoursesVC = myCoursesStoryboard.instantiateViewController(withIdentifier: "OngoingAndCompletedViewController") as? OngoingAndCompletedViewController
            myCoursesVC?.ongoingCourses = self.ongoingCourses
            myCoursesVC?.completedCourses = self.completedCourses
            self.navigationController?.pushViewController(myCoursesVC!, animated: true)
        }
    }
    
    @IBAction func myProfileBtn(_ sender: Any) {
        let profileStoryboard = UIStoryboard.init(name: "Profile", bundle: Bundle.main)
        let profileVC = profileStoryboard.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController
        profileVC?.profileModel = profileData[0]
        self.navigationController?.pushViewController(profileVC!, animated: true)
    }
    
    @IBAction func notificationBtn(_ sender: Any) {
        sideMenuConstraint.constant = 0
        animateView()
        configureNavigationBar()
        let notificationsStoryboard = UIStoryboard.init(name: "Notifications", bundle: Bundle.main)
        let notificationsVC = notificationsStoryboard.instantiateViewController(withIdentifier: "NotificationsViewController") as? NotificationsViewController
        self.navigationController?.pushViewController(notificationsVC!, animated: true)
    }
    
    @IBAction func settingsBtn(_ sender: Any) {
        sideMenuConstraint.constant = 0
        animateView()
        configureNavigationBar()
        let settingsStoryboard = UIStoryboard.init(name: "Settings", bundle: Bundle.main)
        let settingsVC = settingsStoryboard.instantiateViewController(withIdentifier: "SettingViewController") as? SettingViewController
        self.navigationController?.pushViewController(settingsVC!, animated: true)
    }
    
    @IBAction func logoutBtn(_ sender: Any) {
        sideMenuConstraint.constant = 0
        animateView()
        configureNavigationBar()
        let alert = UIAlertController(title: "Are you sure want to logout?", message: "" , preferredStyle: .alert)
        let optionNo = UIAlertAction(title: "Cancel", style: .cancel) { (selection) in
            alert.dismiss(animated: true, completion: nil)
        }
        let optionYes = UIAlertAction(title: "Logout", style: .default) { (selection) in
            alert.dismiss(animated: true, completion: nil)
            self.userLogout.logout(url: URL.fetchURLForLogout()) { (Any) in
                DispatchQueue.main.async {
                    let loginStoryboard = UIStoryboard.init(name: "Login", bundle: Bundle.main)
                    let loginVC = loginStoryboard.instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController
                    self.navigationController?.pushViewController(loginVC!, animated: true)
                }
            }
        }
        present(alert, animated: true, completion: nil)
        alert.addAction(optionNo)
        alert.addAction(optionYes)
        
    }

    
    
    @objc func hamburgerButtonPressed(_ sender: Any) {
        navigationItem.hidesBackButton = true
        hamburgerView.translatesAutoresizingMaskIntoConstraints = false
        sideMenuConstraint.constant = -350
        animateView()
    }
    
    func animateView() {
        UIView.animate(withDuration: 0.3, animations: {
                        self.view.layoutIfNeeded() })
        navigationItem.leftBarButtonItems = []
        self.view.backgroundColor = .black
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        if touch?.view != hamburgerView {
            configureNavigationBar()
            sideMenuConstraint.constant = -350
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
}

extension HomeScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "firstTableCell") as! HomeScreenTableViewCell
            cell.allCourses = self.allCourses
            cell.nameViewLabel.text = self.nameString
            cell.configureCells(indexPath: indexPath.row)
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "secondTableCell") as! HomeScreenTableViewCell
            cell.allCourses = self.allCourses
            cell.contentView.backgroundColor = .white
            cell.delegate = self
            cell.configureCells(indexPath: indexPath.row)
            return cell
        }
        else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "thirdTableCell") as! HomeScreenTableViewCell
            cell.navigationDelegate = self
            if cell.allButtonStatus == true {
                cell.homeScreenTV = self.homeScreenTableview
                cell.allCourses = self.popularCourses
                cell.delegate = self
                cell.configureCells(indexPath: indexPath.row)
                return cell
            } else {
                cell.allCourses = self.allCourses
                cell.configureCells(indexPath: indexPath.row)
                return cell
            }
            
        } else if indexPath.row > 2{
            
            let categoriesArray = [viewModel.design, viewModel.development, viewModel.photography, viewModel.lifestyle]
            let cell = tableView.dequeueReusableCell(withIdentifier: "fourthTableCell") as! HomeScreenTableViewCell
            cell.categoryTopCourses = sortedCategory
            cell.allCourses = categoriesArray[indexPath.row - 3]
            cell.contentView.backgroundColor = .white
            cell.fourthCellHeaderLbl.text = "Top courses in \(sortedCategory[indexPath.row - 3])"
            cell.configureCells(indexPath: indexPath.row)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 260
        } else if indexPath.row == 1 {
            return 120
        }
        
        else if indexPath.row == 2 {
            return 220
        } else {
            return 230
        }
        
    }
}

extension HomeScreenViewController: HomeScreenNavigationDelegate {
    
    func didSelectCategorySeeAllButton() {
        
        let categoryStoryboard = UIStoryboard.init(name: "Categories", bundle: Bundle.main)
        let categoryVC = categoryStoryboard.instantiateViewController(withIdentifier: "CategoriesViewController") as? CategoriesViewController
        getCategoryAllCourse()
        categoryVC?.categoryAllCourses = allCourses
        getCategoryPopularCourses()
        categoryVC?.categoryPopularCourses = popularCourses
        self.navigationController?.pushViewController(categoryVC!, animated: true)
    }
    
    func didSelectCoursesSeeAllButton() {
        
        let courseStoryboard = UIStoryboard.init(name: "Categories", bundle: Bundle.main)
        let courseVC = courseStoryboard.instantiateViewController(withIdentifier: "ChoiceYourCourseViewController") as? ChoiceYourCourseViewController
        getCategoryAllCourse()
        courseVC?.userAllCourses = allCourses
        self.navigationController?.pushViewController(courseVC!, animated: true)
    }
}

extension HomeScreenViewController: UISearchBarDelegate {
    
    @objc func searchItemTapped() {
        let searchStoryboard = UIStoryboard.init(name: "SearchStoryboard", bundle: Bundle.main)
        let searchVC = searchStoryboard.instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController
        self.navigationController?.pushViewController(searchVC!, animated: true)
    }
}


extension HomeScreenViewController: NavigationDelegate {
    func didSelectItem(courseName: String, courseId: String, courseCategory: String, courseImage: UIImage, numberOfChapters: Int) {
        let overviewStoryBoard = UIStoryboard.init(name: "Overview", bundle: Bundle.main)
        let masterVC = overviewStoryBoard.instantiateViewController(withIdentifier: "MasterOverviewChapterViewController") as? MasterOverviewChapterViewController
        masterVC?.courseName = courseName
        masterVC?.courseId = courseId
        masterVC?.courseNameReference = courseName
        masterVC?.courseCategoryReference = courseCategory
        masterVC?.numberOfChapterReference = numberOfChapters
        masterVC?.courseImageReference = courseImage
        self.navigationController!.pushViewController(masterVC!, animated: true)
    }
    }

