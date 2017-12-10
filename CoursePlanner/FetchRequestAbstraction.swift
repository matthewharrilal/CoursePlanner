//
//  FetchRequestAbstraction.swift
//  CoursePlanner
//
//  Created by Matthew Harrilal on 12/6/17.
//  Copyright © 2017 Matthew Harrilal. All rights reserved.
//

import Foundation
import UIKit
import CoreData


func fetchRequest<T: NSManagedObject>(nameOfEntity: String, type: T.Type) -> [T]? {
    let fetchRequest = NSFetchRequest<T>(entityName: nameOfEntity)
    let result = try? CoreDataStack.instance.viewContext.fetch(fetchRequest)
    return result
}



