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
    
    @IBOutlet var btnSave: UIButton!
    var isUpdate = false
    var indexRow = Int()
    var collegeDetails: College?
    
    //MARK: VIEW LIFECYCLES
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtCollegeName.text = collegeDetails?.name
        self.txtCollegeAddress.text = collegeDetails?.address
        self.txtCollegeUniversity.text = collegeDetails?.university
        self.txtCollegeCity.text = collegeDetails?.city

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if isUpdate{
            btnSave.setTitle("Update", for: .normal)
        }else{
            btnSave.setTitle("Save", for: .normal)
        }
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
