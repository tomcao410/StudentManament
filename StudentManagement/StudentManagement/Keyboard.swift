//
//  Keyboard.swift
//  StudentManagement
//
//  Created by Tom on 10/27/18.
//  Copyright © 2018 Tom. All rights reserved.
//

import Foundation
import UIKit


class UI{
    static func btnDone (controls : [UITextField]){
        for textField in controls {
            let toolbar = UIToolbar();
            toolbar.items = [UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil),UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target:textField, action: #selector(UITextField.resignFirstResponder))];
            toolbar.sizeToFit();
            textField.inputAccessoryView = toolbar;
        }
    }
}
