//
//  PeopleTabViewController.swift
//  IOS_WEEK1_HW
//
//  Created by 홍희수 on 2022/01/14.
//

import UIKit

class PeopleTabViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func myProfileImgButtonClicked(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "profileImgClickedViewController") as? profileImgClickedViewController else { return }
        
        //nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    

}
