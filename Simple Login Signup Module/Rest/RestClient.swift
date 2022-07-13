//
//  RestClient.swift
//  Simple Login Signup Module
//
//  Created by Pankaj Kumar Pal on 12/07/22.
//

import Foundation
import Alamofire

class RestClient {
    
    static let shareInstance = RestClient()
    
    func callingRegisterAPI(registerModel: RegisterModel) {
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        
        AF.request("\(register_url)", method: .post, parameters: registerModel, encoder: JSONParameterEncoder.default, headers: headers).response { response in
            debugPrint(response)
        }
    }
    
    func login(loginModel: LoginModel, completionHandler: @escaping (Bool, Any) -> ()) {
        
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        
        AF.request("\(login_url)", method: .post, parameters: loginModel, encoder: JSONParameterEncoder.default, headers: headers).response { response in
            debugPrint(response)
            switch response.result {
            case .success(let data):
                do {
                    let loginResponse: LoginResponseModel = try! JSONDecoder().decode(LoginResponseModel.self, from: data!)
                    if response.response?.statusCode == 200 {
                        completionHandler(true, loginResponse)
                    } else {
                        completionHandler(false, loginResponse)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                completionHandler(false, LoginResponseModel(message: "", token: "", userDetails: User(firstName: "", lastName: "", fullName: "", userName: "", email: "", phoneNumber: 0, profileImage: "", socialId: "", socialLoginType: "", guestUser: false)))
            }
        }
    }
    
    func forgotPassword(resetPasswordModel: ResetPasswordModel, completionHandler: @escaping (Bool, Any) -> ()) {
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        
        AF.request("\(forgot_password_url)?username=\(resetPasswordModel.username)", method: .put, parameters: "", encoder: JSONParameterEncoder.default, headers: headers).response { response in
            debugPrint(response)
            switch response.result {
            case .success(let data):
                do {
                    let loginResponse: LoginResponseModel = try! JSONDecoder().decode(LoginResponseModel.self, from: data!)
                    if response.response?.statusCode == 200 {
                        completionHandler(true, loginResponse)
                    } else {
                        completionHandler(false, loginResponse)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                completionHandler(false, LoginResponseModel(message: "", token: "", userDetails: User(firstName: "", lastName: "", fullName: "", userName: "", email: "", phoneNumber: 0, profileImage: "", socialId: "", socialLoginType: "", guestUser: false)))
            }
        }
    }
}
