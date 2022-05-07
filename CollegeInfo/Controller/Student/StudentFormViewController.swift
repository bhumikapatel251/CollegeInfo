//
//  StudentFormViewController.swift
//  CollegeInfo
//
//  Created by Bhumika Patel on 07/05/22.
//

import UIKit

class StudentFormViewController: UIViewController {
    @IBOutlet var txtStudentAddress: UITextField!
    @IBOutlet var txtStudentEmail: UITextField!
    
    @IBOutlet var txtStudentMobile: UITextField!
    @IBOutlet var txtStudentName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSaveStudentClicked(_ sender: UIButton) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
