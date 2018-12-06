//
//  HomeViewController.swift
//  Orgnote
//
//  Created by XiaoQian Huang on 12/5/18.
//  Copyright © 2018 XiaoQian Huang. All rights reserved.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController {
    
    var captureSession = AVCaptureSession()
    
    //declare front, back camera and current camera
    var frontCamera: AVCaptureDevice?
    var backCamera: AVCaptureDevice?
    var currentCamera: AVCaptureDevice?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCaptureSession()
        setupDevice()
        setupInputOutput()
        setupPreviewLayer()
        startRunningCaptureSession()
        

        // Do any additional setup after loading the view.
    }
    
    //using the AVCaptureSession to preset the session for taking photo in full resolution
    func setupCaptureSession(){
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
        
    }
    
    //creating the AVCaptureDevice object to represent the autual iOS devices cameras, "discovery seesion" is to find and monitor avaiable capture devices.
    func setupDevice(){
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: AVMediaType.video, position: AVCaptureDevice.Position.unspecified)
        let devices = deviceDiscoverySession.devices
        
        for device in devices{
            if device.position == AVCaptureDevice.Position.back{
                backCamera = device
            }else if device.position == AVCaptureDevice.Position.front{
                frontCamera = device
            }
        }
        
        currentCamera = backCamera
    }
    
    func setupInputOutput(){
        
    }
    
    func setupPreviewLayer(){
        
    }
    
    func startRunningCaptureSession(){
        
    }
    
    
    @IBAction func cameraButton(_ sender: UIButton) {
        
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
