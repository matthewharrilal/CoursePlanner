//
//  DisplaySessions.swift
//  CoursePlanner
//
//  Created by Matthew Harrilal on 12/6/17.
//  Copyright © 2017 Matthew Harrilal. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DisplaySessionsTableViewController: UITableViewController {
    
    let addSess = AddSessionViewController()
    
    var dataSource = TableViewDataSource(item: [Course]())
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let fetchRequest = NSFetchRequest<Course>(entityName: "Course")
        do {
            
           fetchRequest.predicate = NSPredicate(format: "session == %@",  addSess.addSessionTextField.text!) 
                let result = try? CoreDataStack.instance.viewContext.fetch(pred)
                self.dataSource.items = result!

            
        }
        
        tableView.dataSource = dataSource
        dataSource.configureCell = {(tableView, indexPath) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            let sessionTime = self.dataSource.items[indexPath.row]
            cell?.textLabel?.text = sessionTime.meetingTimes
            return cell!
        }
        self.tableView.reloadData()
    }
}
