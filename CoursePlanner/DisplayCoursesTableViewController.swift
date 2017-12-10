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
    
    var dataSource = TableViewDataSource(item: [Course]())
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
//        let fetchRequest = NSFetchRequest<Course>(entityName:"Course")
//
//        let result = try? CoreDataStack.instance.viewContext.fetch(fetchRequest)
        let result = fetchRequest(nameOfEntity: "Course", type: Course.self)
        dataSource.items = result!
        tableView.dataSource = dataSource
        dataSource.configureCell = {(tableView, indexPath) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CourseTableViewCell
            let courseName = self.dataSource.items[indexPath.row]
            cell.courseNameLabel.text = courseName.nameOfCourse
            return cell
            
        }
        
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let courses = dataSource.items[indexPath.row]
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let addSessionViewController = storyBoard.instantiateViewController(withIdentifier: "AddSessionViewController") as! AddSessionViewController
//        let displaySessionVC = storyBoard.instantiateViewController(withIdentifier: "DisplaySessionViewController") as! DisplaySessionsViewController
//        displaySessionVC.selectedCourse = courses
        
        addSessionViewController.selectedCourse = courses
        self.navigationController?.pushViewController(addSessionViewController, animated: true)
    }
}
