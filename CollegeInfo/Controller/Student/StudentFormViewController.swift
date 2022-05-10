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
    @IBOutlet var btnStudentSave: UIButton!
    var studentDetails: Student?
    var isUpdate = false
    var indexRow = Int()
    var college: College?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtStudentName.text = studentDetails?.name
        self.txtStudentAddress.text = studentDetails?.address
        self.txtStudentEmail.text = studentDetails?.email
        self.txtStudentMobile.text = studentDetails?.mobile
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if isUpdate{
            btnStudentSave.setTitle("Update", for: .normal)
        }else{
            btnStudentSave.setTitle("Save", for: .normal)
            
        }
    }
 

}
extension StudentFormViewController{
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
            return }
        
        let studentDicts = [
            "studentName": studentName,
            "studentAddress": studentAddress,
            "studentEmail": studentEmail,
            "studentMobile": studentMobile
            ]
        if isUpdate{
            DatabaseHelper.shareInstance.editStudentData(studentDict: studentDicts, index: indexRow)
            isUpdate = false
        }else{
           
        DatabaseHelper.shareInstance.saveStudentData(StudentDict: studentDicts, college: mainCollege)
           
        }
       
     }
}
