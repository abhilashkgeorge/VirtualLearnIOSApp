//
//  TestModuleContainerView.swift
//  VirtualLearnApp
//
//  Created by Prajna P on 19/04/22.
//

import UIKit

class TestModuleContainerView: UIViewController {

    private var showingAlert = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickSubmit(_ sender: Any) {

        let dialogMessage = UIAlertController(title: "Do you want to end the test?", message: "\nYou still have 50 second remaining \n\n If you want to check your answer again, press cancel button. If you want to end the test and submit your answers you can press submit button.", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Submit", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
            
            let testSuccessVc = self.storyboard?.instantiateViewController(withIdentifier: "TestSuccessViewController") as? TestSuccessViewController
            self.navigationController?.pushViewController(testSuccessVc!, animated: true)
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            print("Cancel button tapped")
        }
        
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)
        
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    @IBAction func onClickPrevious(_ sender: Any) {
        
    }
}
