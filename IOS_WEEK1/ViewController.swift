//
//  ViewController.swift
//  IOS_WEEK1
//
//  Created by 홍희수 on 2022/01/04.
//

import UIKit

class ViewController: UIViewController {
    //IBOutlet : 처리결과를 View에 알리고 원하는 동작을 이끔, View에 존재하는 요소와 Controller를 연결하기 위한 변수 개념
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    //IBAction : 유저의 터치, 드래그(이벤트)등을 감지해서 controller에게 알림
    // -> 특정 이벤트 발생시 실행될 동작들을 정의
    @IBAction func changeButtonClicked(_ sender: Any) {
        if nameTextField.text?.isEmpty == false && phoneNumberTextField.text?.isEmpty == false
        {
            titleLabel.text = "\(nameTextField.text!)의 번호는 \(phoneNumberTextField.text!)"
        }
        else
        {
            titleLabel.text = ""
        }
    }
    
}

