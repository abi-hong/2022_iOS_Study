//
//  NetworkResult.swift
//  IOS_WEEK4
//
//  Created by 홍희수 on 2022/02/05.
//

import Foundation

//<T>는 타입 파라미터로 지금 당장 타입을 정하지 않겠다!! 해당 자리에는 다양한 타입(Int, String, Bool 등)이 들어갈 수 있다.

enum NetworkResult<T> {
    case success(T) //서버 통신 성공했을 때
    case requestErr(T) //요청 에러 발생했을 때
    case pathErr //경로 에러 발생했을 때
    case serverErr //서버의 내부적 에러가 발생했을 때
    case networkFail //네트워크 연결 실패했을 때
}
