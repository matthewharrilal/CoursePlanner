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
    
    var selectedCourse: NSManagedObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("This was the selected course \(selectedCourse)")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    @IBAction func addSessionButton(_ sender: UIButton) {
        guard let sessionName = addSessionTextField.text else {return}
        selectedCourse?.setValue(sessionName, forKey: "session")
        let viewContext = CoreDataStack.instance.viewContext
        CoreDataStack.instance.saveTo(context: viewContext)
    }
    
}
