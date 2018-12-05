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
    var location:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //exmaple:
        items = [["id": 1, "name": "1", "category": "1", "description": "1", "location": "hi"], ["id": 2, "name": "2", "category": "2", "description": "Description: A very nice sofa, i bought it from ikea at 2010. there are some sratches that made by Ruby when she was a little puppy.", "location": "hi"]]
        //print("itembylocation view")
        tableView.dataSource = self
        tableView.delegate = self
        print(location)
        //use the location to get the "items" by location
        //items = UserDefaults.standard.object(forKey: location) as![[String:Any]]
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        
        
        let cell = sender as! UITableViewCell
        if let indexPath = tableView.indexPath(for: cell){
            let item = items[indexPath.row]
            let itemDetailViewController = segue.destination as! ItemDetailViewController
            itemDetailViewController.item = item
            //itemDetailViewController.nameLabel.text = item["name"] as? String
            //itemDetailViewController.categoryLabel.text = item["category"] as? String
            //itemDetailViewController.locationLabel.text = item["location"] as? String
            //itemDetailViewController.descriptionLabel.text = item["description"] as? String
        }
        
    }
    

}

extension ItemByLocationViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as! ItemCell
        //let location = Locations[indexPath.row]
        let item = items[indexPath.row]
        cell.nameLabel.text = item["name"] as? String
        cell.categoryLabel.text = item["category"] as? String
        cell.descriptionLabel.text = item["description"] as? String
        //print("here")
        
        
        
        
        
        return cell
    }
}
