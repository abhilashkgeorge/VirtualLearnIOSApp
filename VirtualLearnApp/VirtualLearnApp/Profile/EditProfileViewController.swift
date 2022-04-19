//
//  EditProfileViewController.swift
//  VirtualLearnApp
//
//  Created by Anushree on 12/04/22.
//

import UIKit

protocol Details {
    func passDetails(email: String, job: String, dob: String)
}

class EditProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var genderTableview: UITableView!
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var fullName: FloatingLabel!
    @IBOutlet weak var userName: FloatingLabel!
    @IBOutlet weak var email: FloatingLabel!
    @IBOutlet weak var mobileNumber: FloatingLabel!
    @IBOutlet weak var occupation: FloatingLabel!
    @IBOutlet weak var dob: FloatingLabel!
    @IBOutlet weak var twitterLink: FloatingLabel!
    @IBOutlet weak var facebookLink: FloatingLabel!
    
    let genderList = ["Male", "Female", "Other"]
    var profileDetails = ProfileDataModel(fullName: "Anushree", userName: "anu@11", email: "anu@gmail.com", mobileNumber: "9876543211", occupation: "student", gender: "Female", dob: "01-Jan-2000", twitterLink: "", facebookLink: "", courses: 0, chapters: 0, tests: 0, profileImage: UIImage())
    var detailModification: Details?
    var viewModel = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genderTableview.delegate = self
        genderTableview.dataSource = self
        genderTableview.isHidden = true
        setDetails()
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
        detailModification?.passDetails(email: email.text ?? "Email modification failed", job: occupation.text ?? "Occupation change failed", dob: dob.text ?? "DOB change failed")
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
    
    func setDetails() {
        
        fullName.text = profileDetails.fullName
        userName.text = profileDetails.userName
        profileImage.image = profileDetails.profileImage
        email.text = profileDetails.email
        mobileNumber.text = profileDetails.mobileNumber
        occupation.text = profileDetails.occupation
        dob.text = profileDetails.dob
        gender.text = profileDetails.gender
        twitterLink.text = profileDetails.twitterLink
        facebookLink.text = profileDetails.facebookLink

    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        viewModel.editUserProfile(email: email.text ?? "", occupation: occupation.text ?? "", gender: gender.text ?? "", dob: dob.text ?? "", twitterLink: twitterLink.text ?? "", facebookLink: facebookLink.text ?? "", completionHandler: {
            (successMessage: String) -> Void
            in
            
            if successMessage == "Profile updated successfully" {
                print("Profile updated")
            } else {
                print("Profile updation failed")
            }
        })
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


