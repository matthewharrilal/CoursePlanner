//
//  AddProjectViewController.swift
//  CoursePlanner
//
//  Created by Matthew Harrilal on 12/8/17.
//  Copyright © 2017 Matthew Harrilal. All rights reserved.
//

import Foundation
import UIKit

class AddProjectViewController: UIViewController {
    var course: Course?
    
    @IBOutlet weak var projectNameTextField: UITextField!
    
    @IBOutlet weak var dueDateTextField: UITextField!
    
    @IBOutlet weak var completedTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addProjectButton(_ sender: Any) {
        guard let projectName = projectNameTextField.text,
        let dueDate = dueDateTextField.text,
        let completed = completedTextField.text
        else {return}
        
        let viewContext = CoreDataStack.instance.viewContext
        let project = Project(context: viewContext)
        project.setValue(projectName, forKey: "projectAssignment")
        project.setValue(dueDate, forKey: "dueDate")
        project.setValue(completed, forKey: "completed")
        self.course?.addToProjects(project)
        CoreDataStack.instance.saveTo(context: viewContext)
        let displayProjectsTVC = sendObjectToTableViewController(nameOfViewController: DisplayProjectsViewController.self)
        displayProjectsTVC.course = self.course
        self.navigationController?.pushViewController(displayProjectsTVC, animated: true)
    }
    @IBAction func displayProjectsButton(_ sender: Any) {
        let displayProjectTVC = sendObjectToTableViewController(nameOfViewController: DisplayProjectsViewController.self)
        displayProjectTVC.course = self.course
        self.navigationController?.pushViewController(displayProjectTVC, animated: true)
    }
    
    
}
