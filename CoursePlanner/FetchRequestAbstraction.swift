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

//let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
//let displayNoteViewController = storyboard.instantiateViewController(withIdentifier: "DisplayNotesTableViewController") as! DisplayNotesTableViewController
//displayNoteViewController.session = self.session
//self.navigationController?.pushViewController(displayNoteViewController, animated: true)
//

func sendObjectToTableViewController<T : UITableViewController>(nameOfViewController: T.Type) -> T {
    let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
    let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: nameOfViewController)) as! T
    return viewController
}

func sendObjectFromViewController<T: UIViewController>(nameOfViewController: T.Type) -> T {
    let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
    let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: nameOfViewController)) as! T
    return viewController
}
