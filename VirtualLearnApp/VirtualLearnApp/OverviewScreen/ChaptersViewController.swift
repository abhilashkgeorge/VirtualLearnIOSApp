//
//  ChaptersViewController.swift
//  VirtualLearnApp
//
//  Created by Abhilash k George on 20/04/22.
//

import UIKit

class ChaptersViewController: UIViewController {
    
    var courseName  = ""
    var courseID = ""
    var hiddenSections = Set<Int>()
    
    var count = 0
    
    
    static let tesrVcIdentifier = "TestModuleViewController"
    var chaptersViewModel = ChaptersViewModel()
    var chapterData = [ChapterDataModel]() {
        didSet {
            self.chapterTableView.reloadData()
        }
    }
    var subChapterData = [SubChaptersDataModel]() {
        didSet {
            self.chapterTableView.reloadData()
        }
    }
    

    //MARK: TableView Outlets
    @IBOutlet weak var chapterTableView: UITableView!
    
    
    //MARK: Buttons
    @IBOutlet weak var continueChapterButton: UIButton!

    
    override func viewDidLoad() {
        getSubChapterDetails(name: courseName, id: courseID)
        getChapterDetails(name: courseName, id: courseID)

        super.viewDidLoad()
        chapterTableView.delegate = self
        chapterTableView.dataSource = self
        chapterTableView.alwaysBounceVertical = false
        chapterTableView.rowHeight = UITableView.automaticDimension
    }
    
    func getChapterDetails(name: String, id: String) {

        chaptersViewModel.chapterDetail(name: name, id: id, completionHandler: {

            (_ details: [ChapterDataModel]) -> Void
            in
            DispatchQueue.main.async {
                self.chapterData = details
               self.chapterTableView.reloadData()
            }
        })

        }
    func getSubChapterDetails(name: String, id: String) {

        chaptersViewModel.subChapterDetail(name: name, id: id, completionHandler: {

            (_ details: [SubChaptersDataModel]) -> Void
            in
            DispatchQueue.main.async {
                self.subChapterData = details
                self.chapterTableView.reloadData()
            }
        })

        }
    @IBAction func certificateDownloadButtonTapped(_ sender: Any) {
}
}

extension ChaptersViewController: UITableViewDelegate, UITableViewDataSource {
    
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
                return 24
            }


    func numberOfSections(in tableView: UITableView) -> Int {
        return self.chapterData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.hiddenSections.contains(section) {
            return 0
        }
        
        return chapterData[section].subChapterCount
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
                if indexPath.row == indexPath.endIndex {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "chapterCell") as! ChapterCourseTableViewCell
                    cell.secondCellTitle.text = "Module Test 1"
        
                    return cell
                } else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "chapter") as! ChapterCourseTableViewCell
                    cell.firstCellChapterNumber.text = "\(subChapterData[indexPath.row].chapterNo)"
                    cell.firstCellTitle.text = subChapterData[indexPath.row].videoName
                    return cell
                }
        
    
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
              let button = UIButton()
               let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 22))
       
               let label = UILabel()
               label.frame = CGRect.init(x: 0, y: 0, width: headerView.frame.width, height: headerView.frame.height)
               button.frame = CGRect.init(x: 0, y: 0, width: 10, height: 22)
               label.text = "Chapter " + "\(section + 1)" + " -" + " \(chapterData[section].chapterName)"
               button.setTitle("-", for: .normal)
               label.font = .proximaNovaRegular(size: 12)
               label.textColor = .customGrey
               button.translatesAutoresizingMaskIntoConstraints = false
               button.setTitleColor(.customOrange, for: .normal)
               button.tag = section
               button.addTarget(self,
                                action: #selector(self.hideSection(sender:)),
                                for: .touchUpInside)
               headerView.addSubview(button)
               headerView.addSubview(label)
       
               NSLayoutConstraint.activate([
                   button.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
                   button.topAnchor.constraint(equalTo: headerView.topAnchor),
                   button.widthAnchor.constraint(equalToConstant: 10),
                   button.heightAnchor.constraint(equalToConstant: 22)
       
               ])
    
               return headerView
    }
    
    @objc
    private func hideSection(sender: UIButton) {
//        button.setTitle("+", for: .normal)
        let section = sender.tag
        
        func indexPathsForSection() -> [IndexPath] {
            var indexPaths = [IndexPath]()
            
            for row in 0..<self.subChapterData.count {
                indexPaths.append(IndexPath(row: row,
                                            section: section))
//                chapterTableView.reloadData()
            }
            
            
            return indexPaths
        }
        
        if self.hiddenSections.contains(section) {
            self.hiddenSections.remove(section)
            self.chapterTableView.insertRows(at: indexPathsForSection(),
                                      with: .fade)
        } else {
            self.hiddenSections.insert(section)
            self.chapterTableView.deleteRows(at: indexPathsForSection(),
                                      with: .fade)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == indexPath.last {
            let testStoryboard = UIStoryboard.init(name: "TestModule", bundle: Bundle.main)
            let testVC = testStoryboard.instantiateViewController(withIdentifier: ChaptersViewController.tesrVcIdentifier) as? TestModuleViewController
            self.navigationController?.pushViewController(testVC!, animated: true)
        }

    }
    
}
