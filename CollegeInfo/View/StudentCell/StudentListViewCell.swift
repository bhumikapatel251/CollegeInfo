//
//  StudentListViewCell.swift
//  CollegeInfo
//
//  Created by Bhumika Patel on 07/05/22.
//

import UIKit

class StudentListViewCell: UITableViewCell {

    @IBOutlet var lblStudentMobile: UILabel!
    @IBOutlet var lblStudentEmail: UILabel!
    @IBOutlet var lblStudentName: UILabel!
    var student: Student?{
        didSet{
            lblStudentName.text = "Name : \(student?.name ?? "")"
            lblStudentEmail.text = "Email : \(student?.email ?? "")"
            lblStudentMobile.text = "Mobile : \(student?.mobile ?? "")"
        }
    }
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
