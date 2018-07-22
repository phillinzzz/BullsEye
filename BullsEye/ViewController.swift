//
//  ViewController.swift
//  BullsEye
//
//  Created by 戴林 on 2018/7/18.
//  Copyright © 2018年 dailin. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {

    var currentValue: Int = 50
    var targetValue: Int = 0
    var score = 0
    var rounds = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundsLabel: UILabel!
    
    //let currentValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        
        slider.setThumbImage(thumbImageNormal, for: .normal)
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        
        startOver()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
//        var difference = currentValue - targetValue
//        if difference < 0 {
//            difference = -difference
//        }
        let difference = abs(currentValue - targetValue)
        var points = 100 - difference
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost did it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        score += points
        
        let message = "You scored \(points) points"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: { action in self.startNewRound()})
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
//        startNewRound()
    
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        print("The value of the slider is now: \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func startOver() {
        rounds = 0
        score = 0
        startNewRound()
//        sleep(10)
        let transition = CATransition()
        transition.type = kCATransitionFade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        view.layer.add(transition, forKey: nil)
    }
    
    func startNewRound() {
        
        currentValue = 50
        slider.value = Float(currentValue)
        targetValue = 1 + Int(arc4random_uniform(100))
        rounds += 1
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundsLabel.text = String(rounds)
    }
}

