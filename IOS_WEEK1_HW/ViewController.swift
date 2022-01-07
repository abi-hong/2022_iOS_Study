//
//  ViewController.swift
//  IOS_WEEK1_HW
//
//  Created by 홍희수 on 2022/01/05.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func loginButtonClicked(_ sender: Any) {
        guard let ThirdVC = self.storyboard?.instantiateViewController(identifier: "ThirdViewController") as? ThirdViewController else { return }
        if idTextField.text != "" , passwordTextField.text != ""
        {
            ThirdVC.name = idTextField.text
            ThirdVC.modalPresentationStyle = .fullScreen
            self.present(ThirdVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func makeAccountButtonClicked(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else { return }
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    }
    

