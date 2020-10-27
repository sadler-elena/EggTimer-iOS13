//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let softTime = 1
    let mediumTime = 7
    let hardTime = 12

 
    @IBOutlet weak var timerLabel:
        UILabel!
    @IBOutlet weak var progressView:
        UIView!
    
    @IBOutlet weak var progressBar:
        UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle
        
        
        progressBar.isHidden = false
        switch hardness {
        case "Soft":
            timeTracker(timeInMinutes: softTime, itemName: timerLabel)
        case "Medium":
            timeTracker(timeInMinutes: mediumTime, itemName: timerLabel)
        case "Hard":
            timeTracker(timeInMinutes: hardTime, itemName: timerLabel)

        default:
            print("No hardness selected")
        }
    }
    func timeTracker(timeInMinutes: Int, itemName: UILabel) {
        let timeInSeconds = timeInMinutes * 60
        var secondsRemaining = timeInSeconds
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if secondsRemaining > 0 {
                itemName.text = String(secondsRemaining) + " seconds"
                let secondsPassed = timeInSeconds - secondsRemaining
                let progressCompleted = Float(secondsPassed) / Float(timeInSeconds)
                print(progressCompleted)
                self.progressBar.setProgress(Float(progressCompleted), animated: true)
                secondsRemaining -= 1
            } else {
                Timer.invalidate()
                itemName.text = String("Egg complete")
            }
        }
    }

}
