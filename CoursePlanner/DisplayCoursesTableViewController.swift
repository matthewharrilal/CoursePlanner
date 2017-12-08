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
        
        let fetchRequest = NSFetchRequest<Course>(entityName:"Course")
        
        let result = try? CoreDataStack.instance.viewContext.fetch(fetchRequest)
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
        guard let courses = dataSource.items[indexPath.row] else {return}
        
    }
}
