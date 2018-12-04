//
//  ItemDetailViewController.swift
//  Orgnote
//
//  Created by paul on 12/3/18.
//  Copyright © 2018 XiaoQian Huang. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {
    
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    //@IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    var item:[String:Any]=[:]

    override func viewDidLoad() {
        super.viewDidLoad()
print(item)
        // Do any additional setup after loading the view.
        getData()
    }
    
    func getData(){
        nameLabel.text = item["name"] as? String
        categoryLabel.text = item["category"] as? String
        locationLabel.text = item["location"] as? String
        descriptionTextView.text = item["description"] as? String
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
