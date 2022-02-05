//
//  LoginViewController.swift
//  IOS_WEEK4
//
//  Created by 홍희수 on 2022/02/05.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func loginButtonClicked(_ sender: Any) {
        self.makeRequestAlert(title: "알림",
                              message: "로그인을 하시겠습니까?",
                              okAction: { _ in
                                self.loginAction()
                              })
    }
    
    func loginAction()
    {
        LoginService.shared.login(email: self.idTextField.text!, password: self.passwordTextField.text!) { result in
            switch result
            {
            case .success(let message):
                
                if let message = message as? String{
                    
                    self.makeAlert(title: "알림",
                                   message: message)
                    
                }
                
            case .requestErr(let message):
                
                if let message = message as? String{
                    
                    self.makeAlert(title: "알림",
                                   message: message)
                }
                
                
            default :
                print("ERROR")
            }
        }
    }
    
    
}
