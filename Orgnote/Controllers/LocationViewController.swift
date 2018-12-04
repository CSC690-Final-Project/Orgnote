//
//  LocationViewController.swift
//  Orgnote
//
//  Created by paul on 12/3/18.
//  Copyright © 2018 XiaoQian Huang. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //example
        Locations = ["11","hi", "55", "44", "tt"]
        //print("start")
        tableView.delegate = self
        tableView.dataSource = self
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

extension LocationViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationViewCell") as! LocationViewCell
        let location = Locations[indexPath.row]
        
        cell.locationLabel.text = location
        //print("here")
        

        
        
        
        return cell
    }
    
    
}
