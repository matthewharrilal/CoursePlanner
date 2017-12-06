//
//  TableViewAbstraction.swift
//  CoursePlanner
//
//  Created by Matthew Harrilal on 12/5/17.
//  Copyright © 2017 Matthew Harrilal. All rights reserved.
//

import Foundation
import UIKit

// Making an alias for these values so when neccessary we do not have to type it all in
typealias TableViewCellCallBack = (UITableView, IndexPath) -> UITableViewCell

class TableViewDataSource<Items>: NSObject, UITableViewDataSource {
    // Making an array of the given generic
    var items = [Items]()
    
    // Making an instance of the alias which is basically instantiating a new cell
    var configureCell: TableViewCellCallBack?
    
    // Since we made an array of the given generic now every cell that is instantiated has the ability to parse data from the array of their given data
    init(item: [Items]) {
        self.items = item
    }
    
    // This remain static therefore we can put it in anbstraction and just have it remain constant
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // As for the number of cells that are displayed return the count of the items in the given array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Since the whole point of the abstraction is to keep it dynamic we are going to account for what can go wrong as oppose to what can go right
//        let cell = tableView.dequeueReusableCell(withIdentifier: <#T##String#>)
        guard let configureCell = configureCell  else {
            precondition(false, "Please configure a cell the whole point of abstraction is to keep dynamic")
        }
        // The reasont that we can return the configured cell in this cell for row at function which we know returns the table view cell is if we trace back to what configure cell actually is it is an instantion of our type alias which returns a cell
        
        // What differs though is that to keep the table view as well as the index path dynamic due to the reason because that is going to remain dynamic for each table view implementation therefore we have to pass that in as the arguments of this table view cell
        return configureCell(tableView, indexPath)
    }

    
}
