//
//  StudentInfoViewController.swift
//  StudentManagement
//
//  Created by Tom on 10/25/18.
//  Copyright © 2018 Tom. All rights reserved.
//

import UIKit

class StudentInfoViewController: UIViewController {

    // UI elements
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblDoB: UILabel!
    @IBOutlet weak var lblClassName: UILabel!
    @IBOutlet weak var lblOtherInfo: UILabel!
    
    var student : Student?
    
    
    
    // Work place
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        // Do any additional setup after loading the view.
    }
    
    // Set UI
    func setUI()
    {
        imgAvatar.image = student?.image
        lblName.text = "Name: " + (student?.name)!
        lblGender.text = "Gender: " + (student?.gender)!
        lblDoB.text = "DoB: " + (student?.dob)!
        lblClassName.text = "Class: " + (student?.className)!
        lblOtherInfo.text = "Other info: " + (student?.otherInfo)!
        
    }
 
}
