//
//  ViewController.swift
//  ProteinTracker
//
//  Created by Kevin Zhou on 11/18/15.
//  Copyright © 2015 Kevin Zhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {
    
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
        tableView.reloadData()
        
        
        if (!dailyProtein.text!.isEmpty) {
            
            dailyProtein.text =  String(Double( dailyProtein.text!)! -  Double(proteinAmount.text!)!)
        }
        
    }
    
 

    @IBAction func resetButtonPressed(sender: AnyObject) {
        dailyProtein.text = ""
        proteinDescription.text = ""
        proteinAmount.text = ""
        
        //reset the contents in the table
        list.removeAll()
        tableView.reloadData()
        
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
            cell.textLabel?.text = item.text + " Protein: " +  String(item.proteinAmount)
            return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.dailyProtein.delegate = self
        self.proteinDescription.delegate = self
        self.proteinAmount.delegate = self
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Methods adjust the keyboard setting
    func textFieldDidBeginEditing(textField: UITextField) { // became first responder
        
        //move textfields up
        let myScreenRect: CGRect = UIScreen.mainScreen().bounds
        let keyboardHeight : CGFloat = 216
        
        UIView.beginAnimations( "animateView", context: nil)
        var movementDuration:NSTimeInterval = 0.35
        var needToMove: CGFloat = 0
        
        var frame : CGRect = self.view.frame
        if (textField.frame.origin.y + textField.frame.size.height + /*self.navigationController.navigationBar.frame.size.height + */UIApplication.sharedApplication().statusBarFrame.size.height > (myScreenRect.size.height - keyboardHeight)) {
            needToMove = (textField.frame.origin.y + textField.frame.size.height + /*self.navigationController.navigationBar.frame.size.height +*/ UIApplication.sharedApplication().statusBarFrame.size.height) - (myScreenRect.size.height - keyboardHeight);
        }
        
        frame.origin.y = -needToMove
        self.view.frame = frame
        UIView.commitAnimations()
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        //move textfields back down
        UIView.beginAnimations( "animateView", context: nil)
        var movementDuration:NSTimeInterval = 0.35
        var frame : CGRect = self.view.frame
        frame.origin.y = 0
        self.view.frame = frame
        UIView.commitAnimations()
    }

}

