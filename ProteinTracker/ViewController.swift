//
//  ViewController.swift
//  ProteinTracker
//
//  Created by Kevin Zhou on 11/18/15.
//  Copyright © 2015 Kevin Zhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Outlets
    
    @IBOutlet weak var dailyProtein: UITextField!
    @IBOutlet weak var proteinDescription: UITextField!
    @IBOutlet weak var proteinAmount: UITextField!
    
    
    //MARK: ACTIONS
    
    @IBAction func enterButtonPressed(sender: AnyObject) {
        
        
    }
    

    @IBAction func resetButtonPressed(sender: AnyObject) {
        dailyProtein.text = ""
        proteinDescription.text = ""
        proteinAmount.text = ""
        
        //TODO: reset the contents in the table
        
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

