//
//  DisplayNotesTableViewController.swift
//  CoursePlanner
//
//  Created by Matthew Harrilal on 12/8/17.
//  Copyright © 2017 Matthew Harrilal. All rights reserved.
//

import Foundation
import UIKit

class DisplayNotesTableViewController: UITableViewController {
    var session: Session?
    
    var note: [Note] = [Note]()
    
    var dataSource = TableViewDataSource(item: [Note]())
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        guard let session = session,
        let setNote = session.notes,
        let unwrappedNote = setNote.allObjects as? [Note]
            else {return}
        self.note = unwrappedNote
        self.dataSource.items = self.note
        tableView.dataSource = dataSource
        dataSource.configureCell = {(tableView, indexPath) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            let note = self.dataSource.items[indexPath.row]
            cell?.textLabel?.text = note.contentOfNote
            return cell!
        }
        self.tableView.reloadData()
    }
}
