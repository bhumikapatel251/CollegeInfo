//
//  ViewController.swift
//  CollegeInfo
//
//  Created by Bhumika Patel on 05/05/22.
//

import UIKit

class CollegeListViewController: UIViewController {

    @IBOutlet var collegeListTableView: UITableView!
    var arrCollege = [College]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.arrCollege = DatabaseHelper.shareInstance.getAllCollegeData()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.arrCollege = DatabaseHelper.shareInstance.getAllCollegeData()
        self.collegeListTableView.reloadData()
    }

    @IBAction func btnCollegeAddClicked(_ sender: UIBarButtonItem) {
        let collegeForm = self.storyboard?.instantiateViewController(withIdentifier: "CollegeFormViewController") as! CollegeFormViewController
        self.navigationController?.pushViewController(collegeForm, animated: true)
    }
    
}

extension CollegeListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCollege.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollegeListViewCell", for: indexPath) as! CollegeListViewCell
        cell.college = arrCollege[indexPath.row]
        return cell
    }
}

