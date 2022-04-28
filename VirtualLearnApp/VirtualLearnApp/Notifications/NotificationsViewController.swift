//
//  NotificationsViewController.swift
//  VirtualLearnApp
//
//  Created by Prajna P on 12/04/22.
//
import Foundation
import UIKit

class NotificationsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = NotificationsViewModel()
    
    var notificationList = [NotificationModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
       
        configureNavigationBar()
        loadNotification()
    }
    
    func loadNotification() {
        viewModel.ongoingUserCourses(completionHandler: {
            
            (_ profile: [NotificationModel]) -> Void
            in
            DispatchQueue.main.async {
                self.notificationList = profile
            }
        })
    }
    
    func configureNavigationBar() {
        
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(image: UIImage(named: UIImage.AssetImages.backButton.rawValue), style: .plain, target: self, action: #selector(backBtnTapped))
        ]
    }
    
    @objc func backBtnTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    

}

extension NotificationsViewController: UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let notification = notificationList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell") as! NotificationCell
        if notification.isRead == false {
            cell.unopenedIndication.backgroundColor = .orange
            cell.backgroundColor = UIColor(red:0.94, green:0.96, blue:0.98, alpha:1)
        }
        else {
            cell.unopenedIndication.backgroundColor = .white
        }
        cell.setNotifications(notification: notification)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
         return 114
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let currentCell = tableView.cellForRow(at: indexPath)! as! NotificationCell
        currentCell.unopenedIndication.backgroundColor = .white
        currentCell.backgroundColor = .white
        viewModel.changingIsRead(index: indexPath.row)
    }
}

