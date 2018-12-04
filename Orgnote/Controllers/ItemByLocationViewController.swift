//
//  ItemByLocationViewController.swift
//  Orgnote
//
//  Created by paul on 12/3/18.
//  Copyright © 2018 XiaoQian Huang. All rights reserved.
//

import UIKit

class ItemByLocationViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var items:[[String:Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //exmaple:
        items = [["id": 1, "name": "1", "category": "1", "description": "1", "location": "hi"], ["id": 2, "name": "2", "category": "2", "description": "2", "location": "hi"]]
        //print("itembylocation view")
        tableView.dataSource = self
        tableView.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ItemByLocationViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as! ItemCell
        //let location = Locations[indexPath.row]
        let item = items[indexPath.row]
        cell.nameLabel.text = item["name"] as! String
        //print("here")
        
        
        
        
        
        return cell
    }
}
