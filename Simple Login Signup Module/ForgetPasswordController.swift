//
//  ForgetPasswordController.swift
//  Simple Login Signup Module
//
//  Created by Pankaj Kumar Pal on 12/07/22.
//

import Foundation
import UIKit

class ForgetPasswordController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendLinkAction(_ sender: Any) {
        let username = usernameField.text ?? ""
        if (username).isEmpty {
            alert(message: "Please fill username")
        }
        
        let resetPasswordModel = ResetPasswordModel(username: username)
        RestClient.shareInstance.forgotPassword(resetPasswordModel: resetPasswordModel) { (isSuccess, resetPasswordResponse) in
            let resetPasswordResponseModel: LoginResponseModel = resetPasswordResponse as! LoginResponseModel
            self.alert(message: resetPasswordResponseModel.message)
        }
    }
}
