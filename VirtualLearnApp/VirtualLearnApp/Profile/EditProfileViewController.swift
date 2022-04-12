//
//  EditProfileViewController.swift
//  VirtualLearnApp
//
//  Created by Anushree on 12/04/22.
//

import UIKit

class EditProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {


    @IBOutlet weak var genderTableview: UITableView!
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    
    let genderList = ["Male", "Female", "Other"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genderTableview.delegate = self
        genderTableview.dataSource = self
        genderTableview.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func dropDownButtonTapped(_ sender: Any) {
        if genderTableview.isHidden {
            animation(toogle: true)
        } else {
            animation(toogle: false)
        }
    }
    
    
    @IBAction func changeImageTapped(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = .photoLibrary
        image.allowsEditing = true
        self.present(image, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            profileImage.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func animation(toogle: Bool) {
        if toogle {
            UIView.animate(withDuration: 0.3, animations: {})
            self.genderTableview.isHidden = false
        } else {
            UIView.animate(withDuration: 0.3, animations: {})
            self.genderTableview.isHidden = true
        }
    }
}

extension EditProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genderList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = genderTableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = genderList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        gender.text = genderList[indexPath.row]
        animation(toogle: false)
    }
}


