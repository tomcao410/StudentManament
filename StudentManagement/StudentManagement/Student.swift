//
//  Student.swift
//  StudentManagement
//
//  Created by Tom on 10/24/18.
//  Copyright © 2018 Tom. All rights reserved.
//

import Foundation
import UIKit

 class Student
{
    var image : UIImage
    var name : String
    var gender : String
    var dob : String
    var className : String
    var otherInfo : String
    
    init (image: UIImage, name: String, gender: String, dob: String, className: String, otherInfo: String)
    {
        self.image = image
        self.name = name
        self.gender = gender
        self.dob = dob
        self.className = className
        self.otherInfo = otherInfo
    }
    
    init()
    {
        self.image = UIImage()
        self.name = ""
        self.gender = ""
        self.dob = ""
        self.className = ""
        self.otherInfo = ""
    }
}
