//
//  Session.swift
//  CoursePlanner
//
//  Created by Matthew Harrilal on 12/8/17.
//  Copyright © 2017 Matthew Harrilal. All rights reserved.
//

import UIKit
import CoreData

@objc(Session)
public class Session: NSManagedObject {
    @NSManaged var name: String
    @NSManaged var courses: Set<Course>
    
//    public override var entity: NSEntityDescription = {
//        let desc = NSEntityDescription()
//        desc.name = "Session"
//        return descs
//    }()
}
