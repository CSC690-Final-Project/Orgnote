//
//  Item.swift
//  Orgnote
//
//  Created by paul on 11/29/18.
//  Copyright © 2018 XiaoQian Huang. All rights reserved.
//

import Foundation

//UserDefaults.standard.set(toDoList, forKey: "ToDoList")

class Item {
    
    var itemData: [String:Any]

    static var id: Int = 0
    
    init(name: String, category: String, location: String, description: String) {
        
        Item.id += 1
        self.itemData = ["id":Item.id, "name":name, "category": category, "location":location, "description": description]
    }
    
    
    
    
    
    
}
