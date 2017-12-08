//
//  DisplaySessionsViewController.swift
//  CoursePlanner
//
//  Created by Matthew Harrilal on 12/8/17.
//  Copyright © 2017 Matthew Harrilal. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DisplaySessionsViewController: UITableViewController {
    
    var courses: Course?
    var sessions: [Session]?
    
    var dataSource = TableViewDataSource(item: [Course]())
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print(courses?.nameOfCourse)
        let fetchRequest = NSFetchRequest<Course>(entityName: "Course")
        fetchRequest.predicate = NSPredicate(format: "nameOfCourse == %@", (courses?.nameOfCourse)!)
        let result = try? CoreDataStack.instance.viewContext.fetch(fetchRequest)
        dataSource.items = result!
        print("This is the result \(result)")
        tableView.dataSource = dataSource
        dataSource.configureCell = {(tableView, indexPath) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            let sessionName = self.dataSource.items[indexPath.row].sessions
            print(sessionName?.value(forKey: "name"))
            return cell!
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
