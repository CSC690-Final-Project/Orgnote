//
//  CreateItemViewController.swift
//  Orgnote
//
//  Created by paul on 11/29/18.
//  Copyright © 2018 XiaoQian Huang. All rights reserved.
//

import UIKit

var Locations: [String] = []
var Categories: [String] = []

class CreateItemViewController: UIViewController {
    
    
    
    @IBOutlet weak var newItemImage: UIImageView!
    
    @IBOutlet weak var nameInput: UITextField!
    
    @IBOutlet weak var categoryInput: UITextField!
    
    @IBOutlet weak var locationInput: UITextField!
    //@IBOutlet weak var descriptionInput: UITextField!
    
    @IBOutlet weak var descriptionInput: UITextView!
    
    
    
    var itemsByLocation: [[String:Any]] = []
    
    
    func getDate()->String{
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: now)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //sample locations, delete after
        //Categories = ["San Francisco","California", "San Jose", "San Diego", "San Francisco State"]

        //chooseLocation()
        //chooseCategory()
        
        
    }
    
    @IBAction func selectLocation(_ sender: Any) {
        chooseLocation()
    }
    
    @IBAction func selectCategory(_ sender: Any) {
        chooseCategory()
    }
    
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addButton(_ sender: Any) {
        addItem()
    }
    
    func showAlert(title: String, msg: String){
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func addItem(){
        //[name: String, category: String, location: String, description: String]
        var name:String = ""
        var location: String = ""
        
        
        if (((nameInput?.text) != "") && ((locationInput?.text) != "")) {
            name = nameInput.text!
            location = locationInput.text!
            
            let category = categoryInput.text ?? ""
            //update Category list, if not in Category list
            if category != "" && !Categories.contains(category){
                Categories.append(category)
            }
            let date = getDate()
            
            
            let description = descriptionInput.text ?? ""
            let item = Item(name: name, category: category, location: location, description: description, createdDate: date)
            
            print(item.itemData)
            //print(item.itemData["location"] as! String)
            //let location = item.itemData["location"] as! String
            let itemData = item.itemData
            updateItem(location, itemData)
            dismiss(animated: true, completion: nil)
            
        }else{
            if ((nameInput?.text) == ""){
                showAlert(title: "Invalid Input", msg: "Please Enter Name")
            }else if ((locationInput?.text) == ""){
                showAlert(title: "Invalid Input", msg: "Please Enter Location")
            }
        }
        
    }
    
    func updateItem(_ location: String, _ itemData: [String:Any]){
        
        if Locations.contains(location) {
            //get the list of the location, update the list, and then save
            itemsByLocation = UserDefaults.standard.object(forKey: location) as![[String:Any]]
            //print("location exist")
            itemsByLocation.append(itemData)
            print(itemsByLocation)
            //save itemsByLocation
            UserDefaults.standard.set(itemsByLocation, forKey: location)
            
        }else{
            //append and save
            Locations.append(location)
            
            UserDefaults.standard.set(Locations, forKey: "Locations")
            itemsByLocation.append(itemData)

            UserDefaults.standard.set(itemsByLocation, forKey: location)
            
            
        }
        
    }
    
    
    
    
    func chooseLocation(){
        let alert = UIAlertController(title: "Locations", message: "Choose a location:", preferredStyle: .actionSheet)
        
        func handler(_ act: UIAlertAction){
            locationInput.text = act.title
        }
        
        for location in Locations{
            alert.addAction(UIAlertAction(title: location, style: .default, handler: handler))
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func chooseCategory(){
        let alert = UIAlertController(title: "Categories", message: "Choose a category:", preferredStyle: .actionSheet)
        
        func handler(_ act: UIAlertAction){
            categoryInput.text = act.title
        }
        
        for category in Categories{
            alert.addAction(UIAlertAction(title: category, style: .default, handler: handler))
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
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
