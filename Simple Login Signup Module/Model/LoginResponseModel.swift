//
//  LoginResponseModel.swift
//  Simple Login Signup Module
//
//  Created by Pankaj Kumar Pal on 12/07/22.
//

import Foundation

struct LoginResponseModel: Decodable {
    var message: String
    var token: String?
    var userDetails: User?
}

struct User: Decodable {
    var firstName: String?
    var lastName: String?
    var fullName: String?
    var userName: String
    var email: String
    var phoneNumber: Int?
    var profileImage: String?
    var socialId: String?
    var socialLoginType: String?
    var guestUser: Bool?
}
