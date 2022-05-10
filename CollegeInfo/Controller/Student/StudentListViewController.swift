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
    var college: College?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.arrStudent = DatabaseHelper.shareInstance.getAllStudentData()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        if college?.students?.allObjects != nil{
            arrStudent = college?.students?.allObjects as! [Student]
        }
      //  self.arrStudent = DatabaseHelper.shareInstance.getAllStudentData()
        self.studentTableView.reloadData()
    }
    
    @IBAction func btnAddStudentClicked(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let studentFormVC = storyboard.instantiateViewController(withIdentifier: "StudentFormViewController") as! StudentFormViewController
        studentFormVC.college = college
        self.navigationController?.pushViewController(studentFormVC, animated: true)
    }
   

}
extension StudentListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrStudent.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentListViewCell", for: indexPath) as! StudentListViewCell
        cell.student = arrStudent[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let studentDetaliVC = self.storyboard?.instantiateViewController(withIdentifier: "StudentDetailViewController") as! StudentDetailViewController
        studentDetaliVC.studentDetail = arrStudent[indexPath.row]
        studentDetaliVC.indexRow = indexPath.row
        self.navigationController?.pushViewController(studentDetaliVC, animated: true)
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            arrStudent = DatabaseHelper.shareInstance.deleteStudentData(index: indexPath.row)
            self.studentTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
