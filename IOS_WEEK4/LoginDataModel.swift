//
//  LoginDataModel.swift
//  IOS_WEEK4
//
//  Created by 홍희수 on 2022/02/05.
//

//데이터 모델 만들기
import Foundation

// MARK: - LoginDataModel
struct LoginDataModel: Codable {
    let success: Bool
    let message: String
    let data: UserData? //성공, 실패에 따라 data가 있을수도/없을수도 있기 때문에 ?(옵셔널)형으로 data 선언
    
    enum CodingKeys: String, CodingKey {
        case success
        case message
        case data
    }
    
    //직접 decode 부분 작성
    init(from decoder : Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(UserData.self, forKey: .data)) ?? nil
    }
}

// MARK: - UserData
struct UserData: Codable {
    let userID: Int
    let userNickname, token: String

    enum CodingKeys: String, CodingKey {
        case userID = "UserId"
        case userNickname = "user_nickname"
        case token
    }
}
