//
//  Course.swift
//  CoursePlanner
//
//  Created by Matthew Harrilal on 12/8/17.
//  Copyright © 2017 Matthew Harrilal. All rights reserved.
//

import Foundation
import UIKit
import CoreData

@objc(Course)
public class Course: NSManagedObject {
    @NSManaged var nameOfCourse: String
    @NSManaged var meetingTimes: String
    @NSManaged var session: Set<Session>
    @NSManaged var projects: Set<Project>
}
