//
//  ChaptersViewController.swift
//  VirtualLearnApp
//
//  Created by Abhilash k George on 20/04/22.
//

import UIKit

class ChaptersViewController: UIViewController {
    

    var chaptersViewModel = ChaptersViewModel()
    var chapterData = [ChapterDataModel]()
    
    //MARK: TableView Outlets
    @IBOutlet weak var chapterTableView: UITableView!
    
    
    //MARK: Buttons
    @IBOutlet weak var continueChapterButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        chapterTableView.delegate = self
        chapterTableView.dataSource = self
    }
    
    func getChapterDetails(name: String, id: String) {

        chaptersViewModel.chapterDetail(name: name, id: id, completionHandler: {

            (_ details: [ChapterDataModel]) -> Void
            in
            DispatchQueue.main.async {
                self.chapterData = details
            }
        })

        }
    @IBAction func certificateDownloadButtonTapped(_ sender: Any) {
    }
}

extension ChaptersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "chapterCell") as! ChapterCourseTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "chapter") as! ChapterCourseTableViewCell
            return cell
        }
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
}
