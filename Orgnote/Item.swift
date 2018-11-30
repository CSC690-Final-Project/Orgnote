//
//  Item.swift
//  Orgnote
//
//  Created by paul on 11/29/18.
//  Copyright © 2018 XiaoQian Huang. All rights reserved.
//

import Foundation

class Item {
    
    var itemData: [String:Any]

    var id: Int = 0
    
    init(name: String, category: String, location: String, description: String) {
        
        self.id += 1
        self.itemData = ["id":self.id, "name":name, "category": category, "location":location, "description": description]
    }
    
    
    
    
    
    
}
