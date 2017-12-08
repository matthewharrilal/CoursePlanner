//
//  AddSessionViewController.swift
//  CoursePlanner
//
//  Created by Matthew Harrilal on 12/8/17.
//  Copyright © 2017 Matthew Harrilal. All rights reserved.
//

import Foundation
import UIKit
import CoreData
class AddSessionViewController: UIViewController {
    @IBOutlet weak var addSessionTextField: UITextField!
    
    var selectedCourse: Course?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("This was the selected course \(selectedCourse?.nameOfCourse)")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    @IBAction func addSessionButton(_ sender: UIButton) {
        guard let sessionName = addSessionTextField.text else {return}
        let viewContext = CoreDataStack.instance.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Session", in: viewContext)
        
        let session = Session(entity: entity!, insertInto: viewContext)
        
        session.setValue(sessionName, forKey: "name")
        selectedCourse?.session.insert(session)
        CoreDataStack.instance.saveTo(context: viewContext)
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let displaySession = storyboard.instantiateViewController(withIdentifier: "DisplaySessionViewController") as! DisplaySessionsViewController
        
        displaySession.course = selectedCourse
        self.navigationController?.pushViewController(displaySession, animated: true)
    }
    
}
