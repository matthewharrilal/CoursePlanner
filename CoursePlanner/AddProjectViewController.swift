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
        guard let projectName = projectNameTextField.text else {return}
        let viewContext = CoreDataStack.instance.viewContext
        let project = Project(context: viewContext)
        project.setValue(projectName, forKey: "projectAssignment")
        self.course?.addToProjects(project)
        CoreDataStack.instance.saveTo(context: viewContext)
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let displayProjectsTVC = storyboard.instantiateViewController(withIdentifier: "DisplayProjects") as! DisplayProjectsViewController
        displayProjectsTVC.course = self.course
        self.navigationController?.pushViewController(displayProjectsTVC, animated: true)
    }
}
