//
//  DatabaseHelper.swift
//  CollegeInfo
//
//  Created by Bhumika Patel on 05/05/22.
//

import UIKit
import CoreData

class DatabaseHelper: NSObject {

    static let shareInstance = DatabaseHelper()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveCollegeData(CollegeDict: [String:String]){
        let college = NSEntityDescription.insertNewObject(forEntityName: "College", into: context) as! College
        college.name = CollegeDict["collegeName"]
        college.address = CollegeDict["collegeAddress"]
        college.university = CollegeDict["collegeUniversity"]
        //college.university = CollegeDict["collegeUniversity"]
        college.city = CollegeDict["collegeCity"]
        
        do{
            try context.save()
        }catch let err{
            print("College save error:- \(err.localizedDescription)")
        }
    }
    func getAllCollegeData() -> [College]{
        var arrCollege = [College]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "College")
        do{
            arrCollege = try context.fetch(fetchRequest) as! [College]
        }catch let err{
            print("Error in College fetch :-\(err.localizedDescription)")
        }
        return arrCollege
    }
    
    func deleteCollegeData(index: Int) -> [College]{
        var collegeData = self.getAllCollegeData() // get data
        context.delete(collegeData[index]) //remove from coredata
        collegeData.remove(at: index) // remove in arry college
        do{
            try context.save()
        }catch let err{
            print("delete college data:- \(err.localizedDescription)")
        }
        return collegeData
    }
    
    func editCollegeData(collegeDict: [String: String], index:Int){
        var college = self.getAllCollegeData()
        // origanal data
        college[index].name = collegeDict["collegeName"] // edit data
        college[index].address = collegeDict["collegeAddress"]
        college[index].university = collegeDict["collegeUniversity"]
        college[index].city = collegeDict["collegeCity"]
        do{
            try context.save()
        }catch{
            print("error in edit data")
            
        }
    }
}
