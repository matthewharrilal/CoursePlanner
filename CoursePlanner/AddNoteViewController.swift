//
//  AddNoteViewController.swift
//  CoursePlanner
//
//  Created by Matthew Harrilal on 12/8/17.
//  Copyright © 2017 Matthew Harrilal. All rights reserved.
//

import Foundation
import UIKit

class AddNoteViewController: UIViewController {
    
    @IBOutlet weak var avaroteTextView: UITextView!
    
    var session: Session?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    @IBAction func addNoteButton(_ sender: Any) {
        guard let addNoteText = avaroteTextView.text else {return}
        let viewContext = CoreDataStack.instance.viewContext
        let note = Note(context: viewContext)
        note.contentOfNote = addNoteText
        note.setValue(addNoteText, forKey: "contentOfNote")
        session?.addToNotes(note)
        CoreDataStack.instance.saveTo(context: viewContext)
        let displayNoteViewController = sendObjectToTableViewController(nameOfViewController: DisplayNotesTableViewController.self)
        displayNoteViewController.session = self.session
        self.navigationController?.pushViewController(displayNoteViewController, animated: true)
    }
    
    @IBAction func displayNotesButton(_ sender: Any) {
        let displayNoteViewController = sendObjectToTableViewController(nameOfViewController: DisplayNotesTableViewController.self)
        displayNoteViewController.session = self.session
        self.navigationController?.pushViewController(displayNoteViewController, animated: true)
    }
    
}
