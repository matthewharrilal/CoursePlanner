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
        let fetchRequest = NSFetchRequest<Course>(entityName: "Course")
        do {
            let result = try? CoreDataStack.instance.viewContext.fetch(fetchRequest)
            self.courses = result!
            print("This is the result from the fetch \(String(describing: result))")
            self.tableView.reloadData()
        }
        catch {
            let error = error as NSError?
            print("Fatal error in the fetch request \(error), \(error?.localizedDescription)")
        }
        
        tableView.dataSource = dataSource
        dataSource.items = self.courses
        
        
        dataSource.configureCell = {(tableView, indexPath) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            let courseName = self.courses[indexPath.row]
            cell?.textLabel?.text = courseName.nameOfCourse
            //self.tableView.reloadData()
            return cell!
            
        }
        
        self.tableView.reloadData()
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   
}
