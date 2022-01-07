//
//  SecondViewController.swift
//  IOS_WEEK1_HW
//
//  Created by 홍희수 on 2022/01/05.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var makeIdTextField: UITextField!
    @IBOutlet weak var makePasswordTextField: UITextField!
    @IBOutlet weak var checkPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func makeNewAccountButtonClicked(_ sender: Any) {
        guard let ThirdVC = self.storyboard?.instantiateViewController(identifier: "ThirdViewController") as? ThirdViewController else { return }
        
        ThirdVC.name = makeIdTextField.text
        
        if makeIdTextField.text?.isEmpty == false && makePasswordTextField.text?.isEmpty == false && checkPasswordTextField.text?.isEmpty == false {
            self.present(ThirdVC, animated: true, completion: nil)
        }
    }
}
