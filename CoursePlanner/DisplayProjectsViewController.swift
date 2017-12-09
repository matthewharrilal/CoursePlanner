//
//  DisplayProjectsViewController.swift
//  CoursePlanner
//
//  Created by Matthew Harrilal on 12/8/17.
//  Copyright © 2017 Matthew Harrilal. All rights reserved.
//

import Foundation
import UIKit

class DisplayProjectsViewController: UITableViewController {
    var course: Course?
    
    var project: [Project] = [Project]()
    
    let dataSource = TableViewDataSource(item: [Project]())
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        guard let course = course,
        let project = course.projects,
        let unwrappedProject = project.allObjects as? [Project]
            else {return}
        self.project = unwrappedProject
        self.dataSource.items = self.project
        tableView.dataSource = dataSource
        dataSource.configureCell = {(tableView, indexPath) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            let project = self.dataSource.items[indexPath.row]
            cell?.textLabel?.text = project.projectAssignment
            return cell!
        }
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
