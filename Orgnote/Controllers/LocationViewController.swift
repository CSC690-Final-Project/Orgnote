//
//  LocationViewController.swift
//  Orgnote
//
//  Created by paul on 12/3/18.
//  Copyright © 2018 XiaoQian Huang. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {
    
    @IBOutlet weak var locationSearchBar: UISearchBar!
    var searchLocations:[String] = []
    var searching = false
    
    //var locations1: [String] = ["11","hi", "55", "44", "tt"]
    //Locations = ["11","hi", "55", "44", "tt"]

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //example
        //Locations = ["San Francisco","California", "San Jose", "San Diego", "San Francisco State"]
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let cell = sender as! UITableViewCell
        if let indexPath = tableView.indexPath(for: cell){
            
            var location: String = ""
            
            if searching{
                location = searchLocations[indexPath.row]
            }else{
                location = Locations[indexPath.row]
            }
            
            let itemByLocationViewController = segue.destination as! ItemByLocationViewController
            itemByLocationViewController.location = location
           
        }
    }
}

extension LocationViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searching{
            return searchLocations.count
        }else{
            return Locations.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationViewCell") as! LocationViewCell
        
        var location:String = ""
        
        if searching{
            location = searchLocations[indexPath.row]
        }else{
            location = Locations[indexPath.row]
        }
        
        cell.locationLabel.text = location
        
        return cell
    }
    
}

extension LocationViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searching = false
        tableView.reloadData()
        searchBar.resignFirstResponder()
    
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchLocations = searchText.isEmpty ? Locations: Locations.filter({(location: String) -> Bool in
            // If location name matches the searchText, return true to include it
            
            return (location).range(of: searchText, options: .caseInsensitive) != nil
            
        })
        
        searching = true
        tableView.reloadData()
    }
    
}
