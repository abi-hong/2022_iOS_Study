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
    
    let peopleTabStoryboard : UIStoryboard = UIStoryboard(name: "PeopleTab", bundle: nil)
    
    let KakaoHomeTabStoryboard : UIStoryboard = UIStoryboard(name: "KakaoHomeTab", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func loginButtonClicked(_ sender: Any) {
        guard let peopleTabVC = KakaoHomeTabStoryboard.instantiateViewController(identifier: "HomeTabbarViewController") as? HomeTabbarViewController else {return}
        if idTextField.text != "" , passwordTextField.text != ""
        {
            self.navigationController?.pushViewController(peopleTabVC, animated: true)
        }
    }
    
    @IBAction func makeAccountButtonClicked(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else { return }
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    }
    

