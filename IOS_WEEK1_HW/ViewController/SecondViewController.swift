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
    
    let peopleTabStoryboard : UIStoryboard = UIStoryboard(name: "PeopleTab", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func makeNewAccountButtonClicked(_ sender: Any) {
        let peopleTabVC = peopleTabStoryboard.instantiateViewController(identifier: "PeopleTabViewController")
        
        //ThirdVC.name = makeIdTextField.text
        
        if makeIdTextField.text != "" && makePasswordTextField.text != "" && checkPasswordTextField.text != "" {
            
            peopleTabVC.modalPresentationStyle = .fullScreen
            self.present(peopleTabVC, animated: true, completion: nil)
        }
    }
}
