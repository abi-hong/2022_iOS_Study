//
//  ThirdViewController.swift
//  IOS_WEEK1_HW
//
//  Created by 홍희수 on 2022/01/05.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var nameTextField: UILabel!
    var name : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLabel()
    }
    
    func setLabel() {
        if let nme = self.name
        {
            nameTextField.text = "\(nme)님"
        }
    }
    
    @IBAction func checkButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
