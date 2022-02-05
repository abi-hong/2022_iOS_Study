//
//  LoginService.swift
//  IOS_WEEK4
//
//  Created by 홍희수 on 2022/02/05.
//

//통신을 하는 부분 코드
import Foundation
import Alamofire

struct LoginService{
    static let shared = LoginService()
    
    //GET 방식과는 다르게, POST에서는 body에 데이터를 실어서 요청가능
    //ex) 로그인도 아이디/패스워드를 같이 담아서 보내야함 -> 따라서 아이디, 비밀번호를 매개변수로 받아서 Parameters 형태로 return하는 함수 작성
    private func makeParameter(email : String, password : String) -> Parameters
    {
        return ["email" : email,
                "password" : password]
    }
    
    func login(email : String,
               password : String,
               completion : @escaping (NetworkResult<Any>) -> Void)
    {
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        //아까 선언해둔 APIConstants를 통해 URL을 바로 넣어주는 모습을 확인가능
        //method는 post로
        //GET에서는 parameter를 안넘겨줬는데 여기서는 위에서 만든 makeParameter를 통해 parameter를 넘겨준다.
        let dataRequest = AF.request(APIConstants.loginURL,
                                     method: .post,
                                     parameters: makeParameter(email: email, password: password),
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        
        dataRequest.responseData { dataResponse in
            
            dump(dataResponse)
            
            switch dataResponse.result {
            case .success:
                
                
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
                
            case .failure: completion(.pathErr)
                
            }
        }
        
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        
        //지금 하려는 것은 서버에서 주는 값 중에서 message만 빼서 밖으로 전달할 것!
        //이 메세지를 가지고 밖에서 UIAlertController를 만들 것, 거기에 메세지를 넣어준다면 성공했는지, 안했는지 파악가능!
        
        //먼저 메세지를 빼오려면 서버에서 넘어온 데이터를 decode 해야한다.
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(LoginDataModel.self, from: data)
        else { return .pathErr}
        
        switch statusCode {
        
        case 200: return .success(decodedData.message)
        case 400: return .requestErr(decodedData.message)
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    
    
}
