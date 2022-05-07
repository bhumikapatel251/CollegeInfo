//
//  Student+CoreDataProperties.swift
//  CollegeInfo
//
//  Created by Bhumika Patel on 07/05/22.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var email: String?
    @NSManaged public var mobile: String?

}

extension Student : Identifiable {

}
