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
    
    var course: Course?
    var sessions: [Session] = [Session]()
    
    var dataSource = TableViewDataSource(item: [Session]())
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        guard let course = course,
            let setSession = course.sessions,
            let unwrappedSession = setSession.allObjects as? [Session]
            else {return}
        
//        var arr = sessions.allObjects as! [Session]
        self.sessions = Array(unwrappedSession)
 
    
        
        self.dataSource.items = self.sessions
        
        tableView.dataSource = dataSource
        dataSource.configureCell = {(tableView, indexPath) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            
            let session = self.dataSource.items[indexPath.row]
            
            cell?.textLabel?.text = session.name

            return cell!
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
