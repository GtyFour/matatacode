//
//  UserViewController.swift
//  MatataCode
//
//  Created by GtyFour on 2018/11/14.
//  Copyright © 2018 GtyFour. All rights reserved.
//

import Foundation
import UIKit

class UserViewController: UIViewController{
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var headImage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
