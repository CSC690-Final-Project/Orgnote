//
//  ItemDetailViewController.swift
//  Orgnote
//
//  Created by paul on 12/3/18.
//  Copyright © 2018 XiaoQian Huang. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {
    
    
    @IBOutlet weak var itemImage: UIImageView!
    
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
        print(item["itemImageData"] as? Data)
        let imageData: Data = (item["image"] as? Data)!
        itemImage.image = UIImage(data: imageData)
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let createItemController = segue.destination as! CreateItemViewController
        createItemController.isItemEditing = true
        createItemController.addButton.title = "Save"
        //createItemController.nameInput.text = nameLabel.text
        //createItemController.categoryInput.text = categoryLabel.text
        //createItemController.locationInput.text = locationLabel.text
        //createItemController.descriptionInput.text = descriptionTextView.text
        createItemController.editingItem = item
        
    }
    
    
    

}
