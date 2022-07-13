//
//  ViewController.swift
//  Simple Login Signup Module
//
//  Created by Pankaj Kumar Pal on 12/07/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var backgroundLayer: UIView!
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginAction(_ sender: UIButton) {
        let username = usernameField.text ?? ""
        let password = passwordField.text ?? ""
        if (username).isEmpty {
            alert(message: "Please fill username")
        }
        if (password).isEmpty {
            alert(message: "Please fill password")
        }

        let loginModel = LoginModel(userName: username, password: password)
        RestClient.shareInstance.login(loginModel: loginModel) { (isSuccess, loginResponse) in
            if isSuccess {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let dashboardTabBarController = storyboard.instantiateViewController(withIdentifier: "DashboardTabBarController") as! UITabBarController
                let dashboardController: DashboardController = dashboardTabBarController.viewControllers![0] as! DashboardController
                let loginResponseModel: LoginResponseModel = loginResponse as! LoginResponseModel
                dashboardController.name = (loginResponseModel.userDetails?.firstName)!
                self.navigationController?.pushViewController(dashboardTabBarController, animated: true)
            } else {
                let loginResponseModel: LoginResponseModel = loginResponse as! LoginResponseModel
                self.alert(message: loginResponseModel.message)
            }
        }
        
    }
    
    @IBAction func signupAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let registerController = storyboard.instantiateViewController(withIdentifier: "RegisterController") as! RegisterController
        self.navigationController?.pushViewController(registerController, animated: true)
    }
}
