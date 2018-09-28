//
//  ViewController.swift
//  Todoey
//
//  Created by Mark Schnoebelen on 9/27/18.
//  Copyright © 2018 Mark Schnoebelen. All rights reserved.
//

import UIKit


//when you use a UITableViewController instead of a UIViewController,
//you don't need to subclass as "UITableViewDelegate," "UITableViewDataSource,"
//dont set IBOutlets, set us as tableview delegate, or set us as datasource
class TodoListViewController: UITableViewController {

    let itemArray = ["Find Mike", "Buy Eggos", "Destroy Demogorgon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: Tableview Datasource Methods
    
    //TODO: Declare numberOfRowsInSection here:
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return the number of messages our in our array
        return itemArray.count
    }
    
    //TODO: Declare cellForRowAtIndexPath here:
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //create path to cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        //set the cell textlabel text (part of the tableview), with
        //the indexPath row number in our itemArray
        cell.textLabel?.text = itemArray[indexPath.row]
        
        //return the cell back to the table to display it
        return cell
        
    }
    
    //MARK: Tableview Delegate Methods
    
    //Todo: TableView tap row (didSelectRowAt)
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //get the tableView, at the selected cell row at the indexPath
        //check to see if the cell already has a checkmark accessory
        if (tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark){
            //already has a checkmark, set to none
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else{
            //doesnt already have a checkmark - set to have one
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        //instead of leaving selected row highlighted, the selected row highlights
        //and then the highlight fades and is deselected
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

