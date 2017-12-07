//
//  AddSessionViewController.swift
//  CoursePlanner
//
//  Created by Matthew Harrilal on 12/6/17.
//  Copyright © 2017 Matthew Harrilal. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class AddSessionViewController: UIViewController {
    
    @IBOutlet weak var addSessionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addSessionButton(_ sender: UIButton) {
//        guard let sessionName = addSessionTextField.text else{return}
//        let viewContext = CoreDataStack.instance.viewContext
//        let session = Session(context: viewContext)
//        session.meetingTimes = sessionName
//
//        CoreDataStack.instance.saveTo(context: viewContext)
        guard let sessionName = addSessionTextField.text else {return}
        let fetchRequest = NSFetchRequest<Course>(entityName: "Cart")
        let courses = DisplayCourseViewController()
        let buttonPosition: CGPoint = sender.convert(CGPoint.zero, to: courses.tableView)
        guard let indexPath = courses.tableView.indexPathForRow(at: buttonPosition) else {return}
        let currentCourse = courses.dataSource.items[indexPath.row]
        currentCourse.setValue(sessionName, forKey: "session")
    }
}
