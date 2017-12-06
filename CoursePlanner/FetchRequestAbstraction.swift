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


// This abstracts the way the user makes a fetch request making the entity dynamic 
func fetchRequestFromViewContext<T: NSManagedObject>(nameOfEntity: T) {
    let fetchRequest = NSFetchRequest<T>(entityName: "\(nameOfEntity)")
    do {
        let result = try? CoreDataStack.instance.viewContext.fetch(fetchRequest)
       
    }
}
