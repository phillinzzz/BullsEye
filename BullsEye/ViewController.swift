//
//  ViewController.swift
//  BullsEye
//
//  Created by 戴林 on 2018/7/18.
//  Copyright © 2018年 dailin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 50
    //let currentValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        
        let message = "The value of the slider is: \(currentValue)"
        let alert = UIAlertController(title: "Hello, world!", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        print("The value of the slider is now: \(slider.value)")
        currentValue = lroundf(slider.value)
    }
}

