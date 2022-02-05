//
//  DecodeVC.swift
//  IOS_WEEK4
//
//  Created by 홍희수 on 2022/02/05.
//

import UIKit

//구조체 하나 만들어서 내부에 프로퍼티 선언하고 Decodable을 채택(이 데이터 모델은 다른 데이터로부터 요 데이터 모델로 디코딩이 가능!)
//Decode: JSON -> 데이터 모델
struct CoffeeDataModel : Decodable {
    var drink : String
    var price : Int
    var orderer : String

    //(1) key 이름이 변경될 때 사용, 꼭 CodingKeys라는 이름으로 열거형 선언!!
    enum CodingKeys : String, CodingKey{
        
        case drink
        case price = "coffee_price"
        case orderer
    }
    //(2) 데이터 셋 자체가 넘어오지 않는 경우 직접 decode를 해야한다!
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        //만약 try? 해서 decode했는데 실패한다면 우측 빈스트링 or 0이 값으로 할당되어 decode가 진행됨
        drink = (try? values.decode(String.self, forKey: .drink)) ?? ""
        price = (try? values.decode(Int.self, forKey: .price)) ?? 0
        orderer = (try? values.decode(String.self, forKey: .orderer)) ?? ""
    }
    
}

class DecodeVC: UIViewController {
    //원래는 서버에서 JSON 데이터를 넘겨주지만, 연습이기때문에 우리가 직접 전달!
    //String에서 """를 작성하면 여러줄의 문자열을 동시에 작성할 수 있다.
    let dummyData = """
        {
            "drink" : "아메리카노",
            "coffee_price" : 3000
        }
    """.data(using: .utf8)!
    /*
     서버쪽에서 데이터를 넘겨줄 때, (1) key 이름이 변경되거나 (2) 데이터 셋 자체가 넘어오지 않는 경우
     (1) key 이름이 변경
     let dummyData = """
         {
             "drink" : "아메리카노",
             "coffee_price" : 2000,
             "orderer" : "JH"
         }
     """.data(using: .utf8)!
     
     해결방법 : CodingKeys라는 것을 사용 -> 기존 프로퍼티 이름은 그대로 놔두고 JSON에서 넘어오는 이름에 대응가능!
     
     (2) 데이터 셋 자체가 넘어오지 않는 경우
     let dummyData = """
         {
             "drink" : "아메리카노",
             
             "orderer" : "JH"
         }
     """.data(using: .utf8)!
     */

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //JSONDecoder를 하나 선언
        let jsonDecoder = JSONDecoder()
        
        //do-catch문을 사용해서 아까 위에서 선언해둔 jsonDecoder에서 decode를 try하는 모습을 확인가능
        do
        {
            //데이터 형을 넣고 어떤 데이터로 decode 할지 작성
            let order = try jsonDecoder.decode(CoffeeDataModel.self, from: dummyData)
            print("디코더 성공")
            dump(order) // 성공시, order의 자세한 정보를 출력하도록 작성
        }
        catch
        {
            print(error)
        }
    }
}
