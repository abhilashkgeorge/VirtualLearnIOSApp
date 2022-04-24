//
//  ChaptersViewController.swift
//  VirtualLearnApp
//
//  Created by Abhilash k George on 20/04/22.
//

import UIKit

class ChaptersViewController: UIViewController {
    
    //MARK: TableView Outlets
    @IBOutlet weak var chapterTableView: UITableView!
    
    
    //MARK: Buttons
    @IBOutlet weak var continueChapterButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        chapterTableView.delegate = self
        chapterTableView.dataSource = self
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
