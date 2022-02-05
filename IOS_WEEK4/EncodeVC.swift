//
//  EncodeVC.swift
//  IOS_WEEK4
//
//  Created by 홍희수 on 2022/02/05.
//

import UIKit

//해당 구조체에 Encodable을 채택 -> 이 데이터 모델은 다른 데이터로 인코딩이 가능하다는 뜻
struct PersonDataModel : Encodable // encode : 데이터모델 -> JSON
{
    var name : String
    var age : Int
}

class EncodeVC: UIViewController {
    //뷰컨 내부에 PersonDataModel 데이터를 선언
    let personData = PersonDataModel(name: "철수", age: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Swift에서는 기본적으로 JSONEncoder를 지원
        // JSONEncoder 인스턴스를 하나 선언 후,
        let jsonEncoder = JSONEncoder()
        // JSON을 보기 좋게 출력하기 위해 outputFormatting 프로퍼티를 .prettyPrinted로 설정!
        jsonEncoder.outputFormatting = .prettyPrinted
        
        //do-catch 구문은 오류 처리를 위한 문법
        //오류 처리 과정(3가지)
        //1. 오류 정의 : enum(열거형)을 통해, error 프로토콜을 채택해서 (해당 상황에서 발생할 수 있는) 에러의 종류 나열
        //2. 함수 이름 옆에 throws라는 키워드를 붙이게 되면 이 함수에서는 throw가 가능!하다는 뜻
        // 함수 내에서 예외 사항인 경우, 아까 위에서 선언한 error를 사용해 throw 던져버림(throw가 붙어있는 함수를 사용하려면 try를 앞에 붙여주어야한다!!)
        //3. 던진 오류 처리하기(아까 던진 오류를 잡는다는 뜻에서 예외처리는 catch 구문 사용) : try문은 do-catch문을 활용해서 작성해야한다.
        
        // encode는 throws가 붙어있기 때문에 try구문으로 처리를 해주어야 한다.
        do
        {
            //위에서 정의한 personData를 encode 시도해보고(try) 성공한 경우 data에 저장해서 print 해보겠다!
            let data = try jsonEncoder.encode(personData)
            print(String(data: data, encoding: .utf8)!)
        }
        //에러가 발생할 경우
        catch
        {
            print(error)
        }
    }


}

