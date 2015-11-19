//
//  ViewController.swift
//  ProteinTracker
//
//  Created by Kevin Zhou on 11/18/15.
//  Copyright © 2015 Kevin Zhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource {
    
    //ToDo items list
    
    var list = [ProteinItem]();
    
    
    //MARK: Outlets
    
    @IBOutlet weak var dailyProtein: UITextField!
    @IBOutlet weak var proteinDescription: UITextField!
    @IBOutlet weak var proteinAmount: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: ACTIONS
    
    @IBAction func enterButtonPressed(sender: AnyObject) {
        
        list.append(ProteinItem(text: proteinDescription.text!, proteinAmount: Double( proteinAmount.text!)!))
        
        
    }
    

    @IBAction func resetButtonPressed(sender: AnyObject) {
        dailyProtein.text = ""
        proteinDescription.text = ""
        proteinAmount.text = ""
        
        //reset the contents in the table
        list.removeAll()
        
    }
    
    //datasource methods
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("cell",
                forIndexPath: indexPath) as! UITableViewCell
            let item = list[indexPath.row]
            cell.textLabel?.text = item.text
            return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.dailyProtein.delegate = self
        self.proteinDescription.delegate = self
        self.proteinAmount.delegate = self
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

