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
    
    
    @IBOutlet weak var itemSearchBar: UISearchBar!
    var searchItems:[[String:Any]] = []
    var searching = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //exmaple:
        items = [["id": 1, "name": "oven", "category": "1", "description": "1", "location": "hi"], ["id": 2, "name": "Box", "category": "2", "description": "Description: A very nice sofa, i bought it from ikea at 2010. there are some sratches that made by Ruby when she was a little puppy.", "location": "hi"]]
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
            
            var item : [String:Any] = [:]
            
            if searching{
                item = searchItems[indexPath.row]
            }else{
                item = items[indexPath.row]
            }
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
        
        if searching{
            return searchItems.count
        }else{
            return items.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as! ItemCell
        //let location = Locations[indexPath.row]
        
        var item : [String:Any] = [:]
        
        if searching{
            item = searchItems[indexPath.row]
        }else{
            item = items[indexPath.row]
        }
        
        cell.nameLabel.text = item["name"] as? String
        cell.categoryLabel.text = item["category"] as? String
        cell.descriptionLabel.text = item["description"] as? String
        //print("here")
        
        
        return cell
    }
}



extension ItemByLocationViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searching = false
        tableView.reloadData()
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchItems = searchText.isEmpty ? items: items.filter({(item: [String:Any]) -> Bool in
            // If location name matches the searchText, return true to include it
            
            return (item["name"] as! String).range(of: searchText, options: .caseInsensitive) != nil
            
        })
        
        searching = true
        tableView.reloadData()
    }
    
}
