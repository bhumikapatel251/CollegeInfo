//
//  CollegeDetailViewController.swift
//  CollegeInfo
//
//  Created by Bhumika Patel on 06/05/22.
//

import UIKit

class CollegeDetailViewController: UITableViewController {

   
    @IBOutlet var lblStudent: UILabel!
    @IBOutlet var lblCollegeCity: UILabel!
    @IBOutlet var lblCollegeUniversity: UILabel!
   @IBOutlet var lblCollegeAddress: UILabel!
    @IBOutlet var lblCollegeName: UILabel!
    var collegeDetail: College?
    var indexRow = Int()
    

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        lblCollegeName.text = collegeDetail?.name ?? ""
        lblCollegeAddress.text = collegeDetail?.address ?? ""
        lblCollegeCity.text = collegeDetail?.city ?? ""
        lblCollegeUniversity.text = collegeDetail?.university ?? ""
    }
    @IBAction func btnEditClicked(_ sender: UIBarButtonItem) {
        let formVc = self.storyboard?.instantiateViewController(withIdentifier: "CollegeFormViewController") as! CollegeFormViewController
        formVc.isUpdate = true
        formVc.collegeDetails = collegeDetail
        formVc.indexRow = indexRow
        self.navigationController?.pushViewController(formVc, animated: false   )
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 4{
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let studentVC = storyboard.instantiateViewController(withIdentifier: "StudentListViewController") as! StudentListViewController
            self.navigationController?.pushViewController(studentVC, animated: true)
        }
    }
}
