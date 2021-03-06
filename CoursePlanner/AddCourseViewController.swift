//
//  AddCourseViewController.swift
//  CoursePlanner
//
//  Created by Matthew Harrilal on 12/5/17.
//  Copyright © 2017 Matthew Harrilal. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class AddCourseViewController: UIViewController {
    
    @IBOutlet weak var addCourseTextField: UITextField!
    
    var displayCourses: DisplayCourseViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addCourseButton(_ sender: Any) {
        guard let courseName = addCourseTextField.text else {return}
        let viewContext = CoreDataStack.instance.viewContext
        let course = Course(context: viewContext)
        course.nameOfCourse = courseName
        CoreDataStack.instance.saveTo(context: viewContext)
    }
}
