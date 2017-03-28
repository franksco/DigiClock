//
//  ViewController.swift
//  DigiClock
//
//  Created by Cory Franks on 3/27/17.
//  Copyright © 2017 Cory Franks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var timer = Timer()

    @IBOutlet var settingsView: UIView!
    @IBOutlet var textColorSeg: UISegmentedControl!
    @IBOutlet var backgroundColorSeg: UISegmentedControl!
    @IBOutlet var settingsButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
        
        settingsView.isHidden = true // here we are setting the settingsView to be hidden on load.
        settingsButton.alpha = 0.40
        
        label.alpha = 0
        settingsView.layer.cornerRadius = 5
        settingsButton.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateTimer() {
        
        let timerFormatter = DateFormatter()
        
        timerFormatter.timeStyle = .medium
        
        label.text = timerFormatter.string(from: Date())
        
        label.alpha = 1.0
        
    } // here we are setting up our time format and telling it where to display
    
    @IBAction func settings(_ sender: Any) {
        
        if settingsView.isHidden == true {
            settingsView.isHidden = false
            settingsButton.setTitle("Hide Settings", for: [])
            settingsButton.alpha = 1.0
        } else {
            settingsView.isHidden = true
            settingsButton.setTitle("Show Settings", for: [])
            settingsButton.alpha = 0.40
        } // here we are saying if the settingsView is hidden when the button is clicked to unhide it.
        
    }
    
    @IBAction func textColor(_ sender: Any) {
        
        if (textColorSeg.selectedSegmentIndex == 0) {
            label.textColor = UIColor.white
        }
        
        if (textColorSeg.selectedSegmentIndex == 1) {
            label.textColor = UIColor.black
        }
        
        if (textColorSeg.selectedSegmentIndex == 2) {
            label.textColor = UIColor.red
        }
        
        if (textColorSeg.selectedSegmentIndex == 3) {
            label.textColor = UIColor.green
        }
        
    }
    
    @IBAction func backgroundColor(_ sender: Any) {
        
        if (backgroundColorSeg.selectedSegmentIndex == 0) {
            label.backgroundColor = UIColor.black
        }
        
        if (backgroundColorSeg.selectedSegmentIndex == 1) {
            label.backgroundColor = UIColor.white
        }
        
        if (backgroundColorSeg.selectedSegmentIndex == 2) {
            label.backgroundColor = UIColor.yellow
        }
        
        if (backgroundColorSeg.selectedSegmentIndex == 3) {
            label.backgroundColor = UIColor.orange
        }
        
    }


}

