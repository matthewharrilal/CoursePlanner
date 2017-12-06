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
      
        let fetchRequest = NSFetchRequest<Course>(entityName: "Course")
        do {
            let result = try? CoreDataStack.instance.viewContext.fetch(fetchRequest)
            self.courses = result!
            print("This is the result from the fetch \(result)")
            self.tableView.reloadData()
        }
        catch {
            let error = error as NSError?
            print("Fatal error in the fetch request \(error), \(error?.localizedDescription)")
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        tableView.dataSource = dataSource
        dataSource.items = courses
        
        // MARK: TODO Abstract the fetch request to core data as well as saving values there
//        let fetchRequest = NSFetchRequest<Course>(entityName: "Course")
//        do {
//            let result = try? CoreDataStack.instance.viewContext.fetch(fetchRequest)
//            self.courses = result!
//            print("This is the result from the fetch \(result)")
//            self.tableView.reloadData()
//        }
//        catch {
//            let error = error as NSError?
//            print("Fatal error in the fetch request \(error), \(error?.localizedDescription)")
//        }
        
        dataSource.configureCell = {(tableView, indexPath) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            let courseName = self.courses[indexPath.row]
            cell?.textLabel?.text = courseName.nameOfCourse
            
            return cell!
        }
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func unwindToCourses(segue: UIStoryboardSegue) {
        let fetchRequest = NSFetchRequest<Course>(entityName: "Course")
        do {
            let result = try? CoreDataStack.instance.viewContext.fetch(fetchRequest)
            self.courses = result!
            print("This is the result from the fetch \(result)")
            self.tableView.reloadData()
        }
        catch {
            let error = error as NSError?
            print("Fatal error in the fetch request \(error), \(error?.localizedDescription)")
        }
    }
}
