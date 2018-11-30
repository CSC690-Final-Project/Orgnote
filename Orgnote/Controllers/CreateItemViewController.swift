//
//  CreateItemViewController.swift
//  Orgnote
//
//  Created by paul on 11/29/18.
//  Copyright © 2018 XiaoQian Huang. All rights reserved.
//

import UIKit

class CreateItemViewController: UIViewController {
    
    
    
    @IBOutlet weak var newItemImage: UIImageView!
    
    @IBOutlet weak var nameInput: UITextField!
    
    @IBOutlet weak var categoryInput: UITextField!
    
    @IBOutlet weak var locationInput: UITextField!
    @IBOutlet weak var descriptionInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addButton(_ sender: Any) {
        addItem()
    }
    
    func addItem(){
//        if location in location list{
//            load the list of the location
//            add item to the list
//
//        }else{
//            update location to location list
//            as new location list
//        }
//        save to list of location to device
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
