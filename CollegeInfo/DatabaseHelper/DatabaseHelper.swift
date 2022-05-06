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
    
}
