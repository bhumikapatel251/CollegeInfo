//
//  CollegeDetailViewController.swift
//  CollegeInfo
//
//  Created by Bhumika Patel on 06/05/22.
//

import UIKit

class CollegeDetailViewController: UITableViewController {

   
    @IBOutlet var lblCollegeCity: UILabel!
    @IBOutlet var lblCollegeUniversity: UILabel!
   @IBOutlet var lblCollegeAddress: UILabel!
    @IBOutlet var lblCollegeName: UILabel!
    var collegeDetail: College?

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        lblCollegeName.text = collegeDetail?.name ?? ""
        lblCollegeAddress.text = collegeDetail?.address ?? ""
        lblCollegeCity.text = collegeDetail?.city ?? ""
        lblCollegeUniversity.text = collegeDetail?.university ?? ""
    }
}
