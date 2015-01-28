//
//  SettingsViewController.swift
//  Steven Tests
//
//  Created by admin on 28/01/2015.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet var usrSettingMaxValueDisplay : UITextField!
    @IBOutlet var usrMaxValue : UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        usrMaxValue.value = NSUserDefaults.standardUserDefaults().floatForKey("maxValue")
        usrSettingMaxValueDisplay.text = String(Int(usrMaxValue.value))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeSlider() {
        NSUserDefaults.standardUserDefaults().setFloat(usrMaxValue.value, forKey: "maxValue")
        usrSettingMaxValueDisplay.text = String(Int(usrMaxValue.value))
    }


}
