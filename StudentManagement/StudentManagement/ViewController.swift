 //
//  ViewController.swift
//  StudentManagement
//
//  Created by Tom on 10/24/18.
//  Copyright © 2018 Tom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    // UI elements
    @IBOutlet weak var tableView: UITableView!
    
    static var students: [Student] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        tableView.delegate = self
        tableView.dataSource = self 
    }

    
    
    @IBAction func editAction(_ sender: UIBarButtonItem)
    {
        self.tableView.isEditing = !self.tableView.isEditing
        sender.title = (self.tableView.isEditing) ? "Done" : "Edit"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "StudentInfo"
        {
            let destVC = segue.destination as! StudentInfoViewController
            destVC.student = sender as? Student
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate
{
    // Implement to Cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return ViewController.students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let student = ViewController.students[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell") as! StudentCell
        
        cell.setStudent(student: student)
        
        return cell 
    }
    
    // Edit
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
    {
        let movedStudent = ViewController.students[sourceIndexPath.item]
        ViewController.students.remove(at: sourceIndexPath.item)
        ViewController.students.insert(movedStudent, at: destinationIndexPath.item)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if (editingStyle == .delete)
        {
            ViewController.students.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    // Detail View Controller
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let student = ViewController.students[indexPath.row]
        performSegue(withIdentifier: "StudentInfo", sender: student )
    }
}
