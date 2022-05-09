//
//  StudentFormViewController.swift
//  CollegeInfo
//
//  Created by Bhumika Patel on 07/05/22.
//

import UIKit

class StudentFormViewController: UIViewController {
    @IBOutlet var txtStudentMobile: UITextField!
    @IBOutlet var txtStudentAddress: UITextField!
    @IBOutlet var txtStudentName: UITextField!
    @IBOutlet var txtStudentEmail: UITextField!
    var college: College?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSaveStudentClicked(_ sender: UIButton) {
        self.StudentSaveData()
        self.navigationController?.popViewController(animated: true)
    }
 

}
// Methods
extension StudentFormViewController{
    func StudentSaveData(){
        guard let studentName = txtStudentName.text else { return }
        guard let studentAddress = txtStudentAddress.text else { return }
        guard let studentEmail = txtStudentEmail.text else { return }
        guard let studentMobile = txtStudentMobile.text else { return }
        guard let mainCollege = college else{
            return
        }
        
        let studentDict = [
            "studentName": studentName,
            "studentAddress": studentAddress,
            "studentEmail": studentEmail,
            "studentMobile": studentMobile
            ]
//        if isUpdate{
//            DatabaseHelper.shareInstance.editCollegeData(collegeDict: collegeDict, index: indexRow)
//            isUpdate = false
//        }else{
        DatabaseHelper.shareInstance.saveStudentData(StudentDict: studentDict, college: mainCollege)
           
//        }
       
     }
}
