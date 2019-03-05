//
//  AddStudentViewController.swift
//  StudentManagement
//
//  Created by Tom on 10/26/18.
//  Copyright © 2018 Tom. All rights reserved.
//

import UIKit

class AddStudentViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // UI elements
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var txtfldName: UITextField!
    @IBOutlet weak var pickerGender: UIPickerView!
    @IBOutlet weak var txtfldDoB: UITextField!
    @IBOutlet weak var pickerDate: UIDatePicker!
    @IBOutlet weak var txtfldClass: UITextField!
    @IBOutlet weak var txtfldOtherInfo: UITextField!
    
    var studentImg = UIImage() 
    
    var genders: [String] = [String]()
    var selectedGenders = 0
    
    // Work place
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pickerGender.delegate = self
        self.pickerGender.dataSource = self
        
        UI.btnDone(controls: [txtfldName,txtfldClass,txtfldOtherInfo])
        
        genders = ["Male", "Female"]
        
        registerKeyboardNotification()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        deregisterKeyboardNotification()
    }
    
    // Create gender picker
    func createDayPicker()
    {
        let genderPicker = UIPickerView()
        genderPicker.delegate = self
        
        txtfldDoB.inputView = genderPicker
    }
    
    // Keyboard
    func registerKeyboardNotification()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func deregisterKeyboardNotification()
    {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWasShown(notification: NSNotification)
    {
        // cho phep scollView co the scroll
        scrollView.isScrollEnabled = true
        
        // lay thong tin ban phim de tinh toan do cao
        let info = notification.userInfo
        let keyboard = (info?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        
        // dat lai content inset cua scrollView
        let contentInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: keyboard!.height, right: 0.0)
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(notification: NSNotification)
    {
        // lay thong tin ban phim de tinh toan do cao
        let info = notification.userInfo
        let keyboard = (info?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        
        // dat lai content inset cua scrollView
        let contentInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: -keyboard!.height, right: 0.0)
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
    }

    // ---------------------------------------------------
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genders.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genders[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedGenders = row
        
    }
    
    func getInfo ()-> Student
    {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        //dateFormatter.timeStyle = DateFormatter.Style.short (time)
        
        let strDate = dateFormatter.string(from: pickerDate.date)
        
        if genders[selectedGenders] == "Male"
        {
            studentImg = #imageLiteral(resourceName: "male")
        }
        else
        {
            studentImg = #imageLiteral(resourceName: "female")
        }
        
        return Student(image: studentImg, name: txtfldName.text!, gender: genders[selectedGenders], dob: strDate, className: txtfldClass.text!, otherInfo: txtfldOtherInfo.text!)

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "btnDone"{
            ViewController.students.append(getInfo());
            
        }
    }

}


