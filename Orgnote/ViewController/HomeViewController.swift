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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCaptureSession()
        setupDevice()
        setupInputOutput()
        setupPreviewLayer()
        startRunningCaptureSession()
        

        // Do any additional setup after loading the view.
    }
    
    //preset photo
    func setupCaptureSession(){
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
        
    }
    
    func setupDevice(){
        
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
