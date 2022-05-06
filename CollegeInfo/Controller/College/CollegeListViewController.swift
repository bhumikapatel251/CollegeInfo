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
   // func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            // delete from index and coredatabase
            arrCollege = DatabaseHelper.shareInstance.deleteCollegeData(index: indexPath.row)
            self.collegeListTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

