//
//  Users+CoreDataProperties.swift
//  Coredata
//
//  Created by Kartik Patel on 2017-04-07.
//  Copyright © 2017 Kartik Patel. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import Coredata


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users");
    }

    @NSManaged public var namr: String?

}
