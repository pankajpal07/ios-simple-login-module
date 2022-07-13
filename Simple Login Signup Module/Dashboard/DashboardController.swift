//
//  DashboardController.swift
//  Simple Login Signup Module
//
//  Created by Pankaj Kumar Pal on 12/07/22.
//

import Foundation
import UIKit

class DashboardController: UIViewController {
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var name: String = "";
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var projectsCountLabel: UILabel!
    @IBOutlet weak var clientsCountLabel: UILabel!
    @IBOutlet weak var tasksCountLabel: UILabel!
    @IBOutlet weak var employeesCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true;
        self.welcomeLabel?.text = "Welcome, " + name
        self.projectsCountLabel?.text = "213"
        self.clientsCountLabel?.text = "12"
        self.tasksCountLabel?.text = "1203"
        self.employeesCountLabel?.text = "153"
    }
    
}
