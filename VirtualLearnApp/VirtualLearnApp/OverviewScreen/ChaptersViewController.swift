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
    
   static let tesrVcIdentifier = "TestModuleViewController"

    var chapterData: [ChapterDataModel]?
    var subChapterData: [SubChaptersDataModel]?
    
    var chaptersViewModel = ChaptersViewModel()

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
        
        guard let chapterData = chapterData else {
            return 0
        }
        return chapterData.count  //2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        guard let chapterData = chapterData else {
            return 0
        }


        if self.hiddenSections.contains(section) {
            return 0
        }
        if chapterData[section].testID == ""{
            return chapterData[section].subChapterCount
        } else {
            return chapterData[section].subChapterCount + 1
        }
   
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let chapterData = chapterData else {
            return UITableViewCell()
        }
        
        guard let subChapterData = subChapterData else {
            return UITableViewCell()
        }
        
        var cells = [UITableViewCell]()
        if indexPath.section == 0 {
            //subChapterData[indexPath.row].chapterNo
            if chapterData[indexPath.section].chapterNo == subChapterData[indexPath.row].chapterNo{
                let cell = tableView.dequeueReusableCell(withIdentifier: "chapter") as! ChapterCourseTableViewCell
                cell.firstCellChapterNumber.text = "\(subChapterData[indexPath.row].serialNumber)"
                cell.firstCellTitle.text = subChapterData[indexPath.row].videoName
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "chapterCell") as! ChapterCourseTableViewCell
                cell.secondCellTitle.text = "Module Test 1"
                return cell
            }
        } else  if indexPath.section == 1{
            if chapterData[indexPath.section].chapterNo == 2{
                let cell = tableView.dequeueReusableCell(withIdentifier: "chapter") as! ChapterCourseTableViewCell
                cell.firstCellChapterNumber.text = "\(subChapterData[indexPath.section].serialNumber)"
                cell.firstCellTitle.text = subChapterData[indexPath.row].videoName
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "chapterCell") as! ChapterCourseTableViewCell
                cell.secondCellTitle.text = "Module Test 1"
                return cell
            }
            
        }
       
        return UITableViewCell()
    }
//            cells.append(cell)
//            for num in 0...chapterData[indexPath.section].subChapterCount {
//
//                print("\(indexPath.row)\(indexPath.section)")
//                let cell = tableView.dequeueReusableCell(withIdentifier: "chapter") as! ChapterCourseTableViewCell
//                cell.firstCellChapterNumber.text = "\(subChapterData[num].serialNumber)"
//                cell.firstCellTitle.text = subChapterData[num].videoName
//                cells.append(cell)
//            }
//            return cells[indexPath.row]
//
//        } else  if chapterData[indexPath.section].chapterNo == 1 {
//            let num = 1
//            for _ in 0...chapterData[indexPath.section].subChapterCount {
//                let cell = tableView.dequeueReusableCell(withIdentifier: "chapter") as! ChapterCourseTableViewCell
//                cell.firstCellChapterNumber.text = "\(subChapterData[num].serialNumber)"
//                cell.firstCellTitle.text = subChapterData[num].videoName
//                cells.append(cell)
//            }
//            return cells[indexPath.row]
//
//        }
//        return UITableViewCell()
//    }
        

//        if chapterData[indexPath.section].chapterNo == 1 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "chapter") as! ChapterCourseTableViewCell
//            for item in 0...1 {
//                for _ in 0...1 {
//                    cell.firstCellChapterNumber.text = "\(subChapterData[item].chapterNo)"
//                    cell.firstCellTitle.text = subChapterData[item].videoName
//                    return cell
//                }
//            }
//        }
//        let cell = tableView.dequeueReusableCell(withIdentifier: "chapterCell") as! ChapterCourseTableViewCell
//                            cell.secondCellTitle.text = "Module Test 1"
//
//                            return cell
//
//    }
//
//
        
        
//
//        if indexPath.row == subChapterData[indexPath.row].chapterNo {
//        for number in 0...subChapterData.count {
//            if chapterData[indexPath.row].chapterNo == subChapterData[number].chapterNo
//            {
//
//                    let cell = tableView.dequeueReusableCell(withIdentifier: "chapter") as! ChapterCourseTableViewCell
//                    cell.firstCellChapterNumber.text = "\(subChapterData[number].chapterNo)"
//                    cell.firstCellTitle.text = subChapterData[number].videoName
//                    return cell
//            } else {
//                let cell = tableView.dequeueReusableCell(withIdentifier: "chapter") as! ChapterCourseTableViewCell
//                cell.firstCellChapterNumber.text = "\(subChapterData[number].chapterNo)"
//                cell.firstCellTitle.text = subChapterData[number].videoName
//                return cell
//                    let cell = tableView.dequeueReusableCell(withIdentifier: "chapterCell") as! ChapterCourseTableViewCell
//                    cell.secondCellTitle.text = "Module Test 1"
//
//                    return cell
//                        }
//
//            }
//        return UITableViewCell()
//    }
           
//        } else {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "chapter") as! ChapterCourseTableViewCell
//            cell.firstCellChapterNumber.text = "\(subChapterData[indexPath.row].chapterNo)"
//            cell.firstCellTitle.text = subChapterData[indexPath.row].videoName
//            return cell
//            let cell = tableView.dequeueReusableCell(withIdentifier: "chapterCell") as! ChapterCourseTableViewCell
//            cell.secondCellTitle.text = "Module Test 1"
//
//            return cell
//        }
//    }


    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let chapterData = chapterData else {
            return UIView()
        }

               let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 22))
        let button = UIButton()
       
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
    
    @objc private func hideSection(sender: UIButton) {
      //  button.setTitle("+", for: .normal)
        
        
//        guard let subChapterData = subChapterData else {
//           return
//        }
        let section = sender.tag
        
        func indexPathsForSection() -> [IndexPath] {
            var indexPaths = [IndexPath]()
            
            for row in 0..<subChapterData!.count {
                indexPaths.append(IndexPath(row: row,
                                            section: section))
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
