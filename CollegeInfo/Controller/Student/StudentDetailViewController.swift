//
//  StudentDetailViewController.swift
//  CollegeInfo
//
//  Created by Bhumika Patel on 09/05/22.
//

import UIKit

class StudentDetailViewController: UITableViewController {

    @IBOutlet var lblStudentMobile: UILabel!
    @IBOutlet var lblStudentEmail: UILabel!
    @IBOutlet var lblStudentAddress: UILabel!
    @IBOutlet var lblStudentName: UILabel!
    var studentDetail: Student?
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    override func viewWillAppear(_ animated: Bool) {
        lblStudentName.text = studentDetail?.name ?? ""
        lblStudentAddress.text = studentDetail?.address ?? ""
        lblStudentEmail.text = studentDetail?.email ?? ""
        lblStudentMobile.text = studentDetail?.mobile ?? ""
    }
    @IBAction func btnStudentEdit(_ sender: UIBarButtonItem) {
        let stuformVC = self.storyboard?.instantiateViewController(withIdentifier: "StudentFormViewController") as! StudentFormViewController
        stuformVC.isUpdate = true
        self.navigationController?.pushViewController(stuformVC, animated: false)
        }
}

