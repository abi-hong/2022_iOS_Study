//
//  SecondeViewController.swift
//  IOS_WEEK1
//
//  Created by 홍희수 on 2022/01/04.
//

import UIKit

class SecondeViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    var message : String? //String형 프로퍼티
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLabel()
    }
    
    func setLabel()
    {
        if let msg = self.message
        {
            messageLabel.text = msg
        }
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        //modal 창 없애기
        //self.dismiss(animated: true, completion: nil)
        
        //navigation stack에 pop을 이용
        self.navigationController?.popViewController(animated: true)
    }
    
}
