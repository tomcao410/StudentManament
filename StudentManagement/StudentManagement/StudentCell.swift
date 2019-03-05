//
//  StudentCell.swift
//  StudentManagement
//
//  Created by Tom on 10/24/18.
//  Copyright © 2018 Tom. All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {
    // UI elements
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblDoB: UILabel!
    @IBOutlet weak var lblClassName: UILabel!
    @IBOutlet weak var lblOtherInfo: UILabel!
    
    // Set student
    func setStudent(student: Student)
    {
        imgAvatar.image = student.image
        lblName.text = "Name: " + student.name
        lblGender.text = "Gender: " + student.gender
        lblDoB.text = "DoB: " + student.dob
        lblClassName.text = "Class: " + student.className
        lblOtherInfo.text = "Other info: " + student.otherInfo 
    }
}
