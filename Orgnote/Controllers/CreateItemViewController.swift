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
    
    
    @IBOutlet weak var newItemImage: UIButton!
    
    @IBOutlet weak var nameInput: UITextField!
    
    @IBOutlet weak var categoryInput: UITextField!
    
    @IBOutlet weak var locationInput: UITextField!
    //@IBOutlet weak var descriptionInput: UITextField!
    
    @IBOutlet weak var descriptionInput: UITextView!
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    
    
    @IBAction func saveButton(_ sender: Any) {
        if isItemEditing {
            updateEditedItem()
        }else{
            addItem()
        }
    }
    
    var itemsByLocation: [[String:Any]] = []
    var isItemEditing = false
    var editingItem:[String:Any]=[:]
    
    
    func getDate()->String{
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: now)
    }
    
    //item_Image
    var item_Image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("")
        if (item_Image != nil) {
            self.newItemImage.setBackgroundImage(item_Image, for: .normal)
        }
       // newItemImage.image = item_Image;
        // Do any additional setup after loading the view.
        //sample locations, delete after
        //Categories = ["San Francisco","California", "San Jose", "San Diego", "San Francisco State"]

        //chooseLocation()
        //chooseCategory()
        if isItemEditing{
            nameInput.text = editingItem["name"] as? String
            categoryInput.text = editingItem["category"] as? String
            locationInput.text = editingItem["location"] as? String
            descriptionInput.text = editingItem["description"] as? String
        }
        
    }
    
    @IBAction func selectLocation(_ sender: Any) {
        chooseLocation()
    }
    
    @IBAction func selectCategory(_ sender: Any) {
        chooseCategory()
    }
    
    //click to pick up photo form album
    //Create a controller and navigate to this controller
    @IBAction func newItemImageClick(_ sender: Any) {
        let vc = ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addButton(_ sender: Any) {
        
        
        if isItemEditing {
            updateEditedItem()
        }else{
            addItem()
        }
        
        
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
            if isItemEditing {
                //this code suppose for editing, however currently not working
                for var item in itemsByLocation{
                    if item["id"] as! Int == itemData["id"] as! Int{
                        for (key, value) in itemData{
                            item[key] = value
                        }
                        
                    }
                }
                
                
            }else{
                itemsByLocation.append(itemData)
            }
            
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
    
    func updateEditedItem(){
        let oldLocation = editingItem["location"] as? String
        let newLocation = locationInput.text
        
        if ( newLocation != oldLocation){
            //remove item in old location
            var itemsByOldLocation = UserDefaults.standard.object(forKey: oldLocation!) as![[String:Any]]
            for item in itemsByOldLocation{
                itemsByOldLocation.removeAll(keepingCapacity: item["id"] as! Int == editingItem["id"] as! Int)
            }
            //add new location or update location
            editingItem["location"] = newLocation
            
        }
        
        editingItem["name"] = nameInput.text
        editingItem["category"] = categoryInput.text
        editingItem["description"] = descriptionInput.text
        
        updateItem(newLocation!, editingItem)
        dismiss(animated: true, completion: nil)
        
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
