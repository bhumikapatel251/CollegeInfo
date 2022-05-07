//
//  CollegeFormViewController.swift
//  CollegeInfo
//
//  Created by Bhumika Patel on 05/05/22.
//

import UIKit

class CollegeFormViewController: UIViewController {
    
    //MARK: OUTLETS
    @IBOutlet var txtCollegeName: UITextField!
    @IBOutlet var txtCollegeAddress: UITextField!
    @IBOutlet var txtCollegeUniversity: UITextField!
    @IBOutlet var txtCollegeCity: UITextField!
    var isUpdate = false
    var indexRow = Int()
    
    //MARK: VIEW LIFECYCLES
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    
    
    
}
//MARK: ACTIONS
extension CollegeFormViewController{
    @IBAction func btnCollegeSaveClicked(_ sender: UIButton) {
        self.collegeSaveData()
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: METHODS
extension CollegeFormViewController{
    func collegeSaveData(){
        guard let collegeName = txtCollegeName.text else { return }
        guard let collegeAddress = txtCollegeAddress.text else { return }
        guard let collegeUniversity = txtCollegeUniversity.text else { return }
        guard let collegeCity = txtCollegeCity.text else { return }
        
        let collegeDict = [
            "collegeName": collegeName,
            "collegeAddress": collegeAddress,
            "collegeUniversity": collegeUniversity,
            "collegeCity": collegeCity
            ]
        
        DatabaseHelper.shareInstance.saveCollegeData(CollegeDict: collegeDict)
            }
}
