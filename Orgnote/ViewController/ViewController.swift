//
//  ViewController.swift
//  Orgnote
//
//  Created by XiaoQian Huang on 12/8/18.
//  Copyright © 2018 XiaoQian Huang. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //agent method for picture selector, inside is some settings for parameter configuration
    lazy var pickerController: UIImagePickerController = {
        let imgPicker = UIImagePickerController()
        imgPicker.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        imgPicker.allowsEditing = false
        imgPicker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
        return imgPicker
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black
        self.cameraButtonClick()

        // Do any additional setup after loading the view.
    }
    
    //click to take photo
    func cameraButtonClick(){
        self.photoAlertSheet()
    }
    
    //setting a pull up meun, users can select camera or album to take photo or photos from album
    func photoAlertSheet() -> Void {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction.init(title:"Camera", style: .default, handler: { (_) in self.takePhoto()
        }))
        
        alert.addAction(UIAlertAction.init(title: "Choose from Album", style: .default, handler: { (_) in
            self.pushImagePickerController()
        }))
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //taking photos
    @objc func takePhoto(){
        if self.checkLibraryAndCameraAuthStatus() == false {
            return;
        }
        //use camera
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)
        {
            //use systems camera
            self.pickerController.sourceType = UIImagePickerController.SourceType.camera
            //set it to use backcamera
            self.pickerController.cameraDevice = UIImagePickerController.CameraDevice.rear
            self.present(self.pickerController, animated: true, completion: nil)
        }
        else{
            print("The camera cannot be turned on in the simulator. Please use it in a real machine.")
        }
    }
    
    //choose from album
    @objc func pushImagePickerController(){
        if self.checkLibraryAndCameraAuthStatus() == false {
            return;
        }
        
        //Determine if the album is supported
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
            self.pickerController.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum
            self.present(self.pickerController, animated: true, completion: nil)
        }
    }
    
    //UIImagePickerControllerDelegate
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //get photos
        let image:UIImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        //take photos
        if picker.sourceType == .camera {
            //save it to album
            UIImageWriteToSavedPhotosAlbum(image, self, #selector(self.image(image:didFinishSavingWithError:contextInfo:)), nil)
        }
        picker.dismiss(animated: true){
            //change to page which add photos
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CreateItemViewController") as! CreateItemViewController
            vc.item_Image = image;
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    //check the saving status, failed or successfully
    @objc func image(image:UIImage,didFinishSavingWithError error:NSError?, contextInfo:AnyObject) {
        if error != nil {
            print("Save to system album failed")
        }else{
            print("Save to system album successfully")
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        if picker.isKind(of: UIImagePickerController.self) {
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
    
    //Detect album and camera permissions @return bool
    func checkLibraryAndCameraAuthStatus() -> Bool {
        if self.checkLibraryAuthStatus() == false{
            return false
        }
        let authStatus:AVAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        if authStatus == AVAuthorizationStatus.restricted || authStatus == AVAuthorizationStatus.denied {
            //check the album permissions before taking photos
            self.showAlertWithTitle(title: "can not access the camera", message: "Please allow access to the camera in the iPhone's Settings - Privacy - Camera")
            return false
        }
        return true
    }
    
    //Detect album permission @return bool
    func checkLibraryAuthStatus() -> Bool {
        let library:PHAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        if library == PHAuthorizationStatus.denied || library == PHAuthorizationStatus.restricted {
            self.showAlertWithTitle(title: "can not access the album", message: "Please allow access to the album in the iPhone's Settings - Privacy - Albums")
            return false
        }
        return true
    }
    
    func showAlertWithTitle(title:String, message:String) -> Void {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Setting", style: .default, handler: { (_) in
            UIApplication.shared.openURL(NSURL(string: UIApplication.openSettingsURLString)! as URL)
        }))
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
