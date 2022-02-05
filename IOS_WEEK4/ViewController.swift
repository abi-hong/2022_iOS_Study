//
//  ViewController.swift
//  IOS_WEEK4
//
//  Created by 홍희수 on 2022/02/05.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //버튼을 누르면 통신을 진행하는 코드
    @IBAction func getButtonClicked(_ sender: Any) {
        //아까 만들어둔 GetPersonDataService 구조체에서 shared라는 공용 인스턴스에 접근(싱글턴 패턴)
        //그리고 만들어둔 getPersonInfo를 사용할 것
        GetPersonDataService.shared.getPersonInfo { (response) in
            switch(response)
            {
            //성공했을 때, <T>형으로 데이터를 하나 받아올 수 있다.
            case .success(let personData):
                if let data = personData as? Person {
                    
                    self.nameLabel.text = data.username
                    self.messageLabel.text = data.name
                }
            //실패했을 때, 분기처리는 다음 case들에서 진행
            case .requestErr(let message) :
                print("requestERR", message)
            case .pathErr :
                print("pathERR")
            case .serverErr:
                print("serverERR")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
