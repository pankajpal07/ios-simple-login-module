//
//  RegisterModel.swift
//  Simple Login Signup Module
//
//  Created by Pankaj Kumar Pal on 12/07/22.
//

import Foundation

struct RegisterModel: Encodable {
    let name: String
    let email: String
    let password: String
}
