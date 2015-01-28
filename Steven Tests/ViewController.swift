//
//  ViewController.swift
//  Steven Tests
//
//  Created by admin on 28/01/2015.
//  Copyright (c) 2015 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var usrGuessTxt : UITextField!
    @IBOutlet var guessOutput : UILabel!

    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaults.setObject(5, forKey: "maxValue")
        generateNumber()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func guess(sender: AnyObject) {
        let randomNumber = Int(defaults.floatForKey("randomNumber"))
        let guess = usrGuessTxt.text.toInt()
        var lives = String(defaults.integerForKey("lives"))
        if lives.toInt() > 0 {
        if guess < randomNumber {
            guessOutput.text = "Guess was too low, " + lives + " HP remaining!"
            usrGuessTxt.text = ""
            defaults.setInteger(lives.toInt()! - 1 , forKey: "lives")
        } else if guess > randomNumber {
            guessOutput.text = "Guess was too high, " + lives + " HP remaining!"
            usrGuessTxt.text = ""
            defaults.setInteger(lives.toInt()! - 1 , forKey: "lives")
        } else {
            guessOutput.text = "Congratulations, you win! A New number has been picked!"
            generateNumber()
            usrGuessTxt.text = ""
        }
        } else if lives.toInt() == 0 {
        guessOutput.text = "Out of lives! The number was " + String(randomNumber) + " a new number has been picked"
        generateNumber()
    usrGuessTxt.text = ""
    }
    }
    }

    func generateNumber() {
         var maxValue = (UInt32(NSUserDefaults.standardUserDefaults().floatForKey("maxValue"))) - 1
        NSUserDefaults.standardUserDefaults().setFloat(Float(arc4random_uniform(maxValue)), forKey: "randomNumber")
        NSUserDefaults.standardUserDefaults().setInteger(3, forKey: "lives")
    }