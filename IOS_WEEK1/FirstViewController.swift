//
//  FirstViewController.swift
//  IOS_WEEK1
//
//  Created by 홍희수 on 2022/01/04.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var messageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func changeButtonClicked(_ sender: Any) {
        //guard는 해당 조건을 검사하고 해당조건이 참이면 그냥 통과, 거짓이면 else로 떨어진다.
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "SecondeViewController") as? SecondeViewController else { return }
        
        nextVC.message = messageTextField.text
        
        //modal창 띄우기
        //self.present(nextVC, animated: true, completion: nil)
        
        //push를 통해 navigation stack에 쌓기
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
}
