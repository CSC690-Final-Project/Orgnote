//
//  HomeViewController.swift
//  Orgnote
//
//  Created by XiaoQian Huang on 12/8/18.
//  Copyright © 2018 XiaoQian Huang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    //click here to take photos
    
    @IBAction func cameraButtonClick(_ sender: Any) {
        let vc = ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
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
