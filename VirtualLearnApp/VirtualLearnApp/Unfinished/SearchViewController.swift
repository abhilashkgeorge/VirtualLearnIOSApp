//
//  SearchViewController.swift
//  VirtualLearnApp
//
//  Created by Abhilash k George on 07/04/22.
//

import UIKit

class SearchViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var topSearchesView: UIView!
    @IBOutlet weak var searchFromCategoryView: UIView!
    @IBOutlet weak var noResultView: UIView!
    @IBOutlet weak var searchCourseTableView: UITableView!
    @IBOutlet weak var filterView: UIView!
    
    @IBOutlet weak var designButton: SearchCategoryButton!
    @IBOutlet weak var developmentButton: SearchCategoryButton!
    @IBOutlet weak var marketingButton: SearchCategoryButton!
    @IBOutlet weak var lifestyleButton: SearchCategoryButton!
    @IBOutlet weak var photographyButton: SearchCategoryButton!
    @IBOutlet weak var chapterButton: SearchCategoryButton!
    
    var searchedArray = [SearchCourseDataModel]() {
        didSet {
            searchCourseTableView.reloadData()
        }
    }
    
    let viewmodel = SearchViewModel()

    var categoryString = ""
    var noOfChap = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "icn_back_header")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "icn_back_header")
        self.title = "Search"
        
        searchCourseTableView.isHidden = true
        filterView.isHidden = true
        noResultView.isHidden = true
        
        searchBar.delegate = self
        searchCourseTableView.delegate = self
        searchCourseTableView.dataSource = self
        self.searchCourseTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    @IBAction func filterTapped(_ sender: Any) {
        topSearchesView.isHidden = true
        filterView.isHidden = false
        
        if(self.searchedArray.count == 1 && self.searchedArray[0].name == "no courseName"){
            searchCourseTableView.isHidden = true
            noResultView.isHidden = false
            searchFromCategoryView.isHidden = false
        }
        else{
            searchCourseTableView.isHidden = false
        }
    }
    
    @IBAction func filterCloseTapped(_ sender: Any) {
        filterView.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchedArray.count
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultTableViewCell", for: indexPath) as! SearchResultTableViewCell
        cell.setStyling()
        cell.courseName.text = searchedArray[indexPath.row].name
        cell.courseCategory.text = searchedArray[indexPath.row].category
        cell.courseNoChapters.text = String(searchedArray[indexPath.row].totalChapters) + " Chapters"
        cell.courseImage.image = searchedArray[indexPath.row].courseImage
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    @IBAction func chapters5_10Tapped(_ sender: UIButton) {
        sender.backgroundColor = UIColor(red:0.99, green:0.75, blue:0.29, alpha:1)
        noOfChap = 5
    }
    @IBAction func designTapped(_ sender: UIButton) {
        sender.backgroundColor = UIColor(red:0.99, green:0.75, blue:0.29, alpha:1)
        categoryString = "Design"
    }
    
    @IBAction func developmentTapped(_ sender: UIButton) {
        sender.backgroundColor = UIColor(red:0.99, green:0.75, blue:0.29, alpha:1)
        categoryString = "Development"
    }
    
    @IBAction func lifestyleTapped(_ sender: UIButton) {
        sender.backgroundColor = UIColor(red:0.99, green:0.75, blue:0.29, alpha:1)
        categoryString = "Lifestyle"
    }
    
    @IBAction func marketingTapped(_ sender: UIButton) {
        sender.backgroundColor = UIColor(red:0.99, green:0.75, blue:0.29, alpha:1)
        categoryString = "Marketing"
    }
    
    @IBAction func photographyTapped(_ sender: UIButton) {
        sender.backgroundColor = UIColor(red:0.99, green:0.75, blue:0.29, alpha:1)
        categoryString = "Photography"
    }
    
    @IBAction func applyFilterTapped(_ sender: Any) {
        filterView.isHidden = true
        viewmodel.searchCourse(name: "", category: categoryString, totalChapters: noOfChap, completionHandler: {
            (searchArry: [SearchCourseDataModel]) -> Void
            in
            
        DispatchQueue.main.async {
            
            self.searchedArray = searchArry
            if(self.searchedArray.count == 1 && self.searchedArray[0].name == "no courseName"){
                        self.noResultView.isHidden = false
                        self.searchFromCategoryView.isHidden = false
                        self.searchCourseTableView.isHidden = true
                    }else {
                        self.searchCourseTableView.isHidden = false
                        
                    }
            }
        })
    }
    
    @IBAction func clearAllTapped(_ sender: Any) {
        
        categoryString = ""
        noOfChap = 0
      
        designButton.backgroundColor = .white
        developmentButton.backgroundColor = .white
        marketingButton.backgroundColor = .white
        lifestyleButton.backgroundColor = .white
        photographyButton.backgroundColor = .white
        chapterButton.backgroundColor = .white
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            topSearchesView.isHidden = true
            searchFromCategoryView.isHidden = true
            searchCourseTableView.isHidden = false
            noResultView.isHidden = true
            viewmodel.searchCourse(name: searchText, category: categoryString, totalChapters: noOfChap, completionHandler: {
                (searchArry: [SearchCourseDataModel]) -> Void
                in
            DispatchQueue.main.async {
                    self.searchedArray = searchArry
                if(self.searchedArray.count == 1 && self.searchedArray[0].name == "no courseName"){
                            self.noResultView.isHidden = false
                            self.searchFromCategoryView.isHidden = false
                            self.searchCourseTableView.isHidden = true
                        }else {
                            self.searchCourseTableView.isHidden = false
                        }
                }
            })
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
    }
}
