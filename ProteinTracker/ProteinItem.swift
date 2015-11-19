//
//  ProteinItem.swift
//  ProteinTracker
//
//  Created by Kevin Zhou on 11/19/15.
//  Copyright © 2015 Kevin Zhou. All rights reserved.
//

import UIKit

class ProteinItem: NSObject {

    var text:String
    var proteinAmount: Double
    
    init(text: String, proteinAmount: Double) {
    
    self.text = text
    self.proteinAmount = proteinAmount
    
    }
    
}
