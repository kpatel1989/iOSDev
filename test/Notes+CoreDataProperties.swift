//
//  Notes+CoreDataProperties.swift
//  test
//
//  Created by Kartik Patel on 2017-04-07.
//  Copyright © 2017 Kartik Patel. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Notes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Notes> {
        return NSFetchRequest<Notes>(entityName: "Notes");
    }

    @NSManaged public var name: String?

}
