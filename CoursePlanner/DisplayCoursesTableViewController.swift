//
//  DisplayCoursesTableViewControllerr.swift
//  CoursePlanner
//
//  Created by Matthew Harrilal on 12/5/17.
//  Copyright © 2017 Matthew Harrilal. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DisplayCourseViewController: UITableViewController {
    
    var courses = [Course]()
    
    var dataSource = TableViewDataSource(item: [Course]())
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let fetchRequest = NSFetchRequest<Course>(entityName:"Course")
        do {
          let result = try? CoreDataStack.instance.viewContext.fetch(fetchRequest)
            dataSource.items = result!
        }
        
        tableView.dataSource = dataSource
        dataSource.configureCell = {(tableView, indexPath) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            let courseName = self.dataSource.items[indexPath.row]
            cell?.textLabel?.text = courseName.nameOfCourse
            //self.tableView.reloadData()
            return cell!
            
        }
        
//        do {
//            let result = try? CoreDataStack.instance.fetchRequestFromViewContext(type: Course.self)
//            self.dataSource.items = result!
//            self.tableView.reloadData()
//        }
//        catch {
//            let error = error as NSError?
//            print("Fatal error in the fetch request \(error), \(error?.localizedDescription)")
//        }
        
    
        self.tableView.reloadData()
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   
}
