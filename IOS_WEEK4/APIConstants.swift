//
//  APIConstants.swift
//  IOS_WEEK4
//
//  Created by 홍희수 on 2022/02/05.
//

import Foundation
struct APIConstants{
    
    // MARK:- Base URL
    static let baseURL = "http://cherishserver.com"
    
    
    // MARK:- Feature URL
    
    static let loginURL = baseURL + "/login/signin"
    static let signupURL = baseURL + "/login/signup"
}
