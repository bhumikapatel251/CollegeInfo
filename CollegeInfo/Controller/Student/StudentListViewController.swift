//
//  StudentListViewController.swift
//  CollegeInfo
//
//  Created by Bhumika Patel on 07/05/22.
//

import UIKit

class StudentListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAddStudentClicked(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let studentFormVC = storyboard.instantiateViewController(withIdentifier: "StudentFormViewController") as! StudentFormViewController
        self.navigationController?.pushViewController(studentFormVC, animated: true)
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
