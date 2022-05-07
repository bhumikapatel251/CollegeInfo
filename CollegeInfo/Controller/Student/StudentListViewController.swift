//
//  StudentListViewController.swift
//  CollegeInfo
//
//  Created by Bhumika Patel on 07/05/22.
//

import UIKit

class StudentListViewController: UIViewController {

    @IBOutlet var studentTableView: UITableView!
    var arrStudent = [Student]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.arrStudent = DatabaseHelper.shareInstance.getAllStudentData()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAddStudentClicked(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let studentFormVC = storyboard.instantiateViewController(withIdentifier: "StudentFormViewController") as! StudentFormViewController
        self.navigationController?.pushViewController(studentFormVC, animated: true)
    }
   

}
