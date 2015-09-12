//
//  ViewController.swift
//  99RedBalloons
//
//  Created by Christopher L Weaver on 9/7/15.
//  Copyright (c) 2015 DadzApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var balloonImage: UIImageView!
    @IBOutlet weak var balloonsLabel: UILabel!

    var balloonArray:[balloon] = []
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        // Populate the array with 99 balloon entries
        createBalloons(99)
        
        // Set the initial image and label
        self.balloonImage.image = balloonArray[currentIndex].image
        self.balloonsLabel.text = balloonArray[currentIndex].label

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Populate the balloonArray object using the Int parameter passed to this function
    func createBalloons(number:Int) {
        for x in 1...number {
            var myBalloon = balloon()
            let randomBalloonImageIndex = Int(arc4random_uniform(UInt32(4)))
            
            switch randomBalloonImageIndex {
            case 0:
                myBalloon.image = UIImage(named: "RedBalloon1.jpg")
            case 1:
                myBalloon.image = UIImage(named: "RedBalloon2.jpg")
            case 2:
                myBalloon.image = UIImage(named: "RedBalloon3.jpg")
            default:
                myBalloon.image = UIImage(named: "RedBalloon4.jpg")
            }
        
            if x < 2 {
                myBalloon.label = "\(x) balloon"
            } else {
                myBalloon.label = "\(x) balloons"
            }
        
            // Add the ojbect to the array
            balloonArray.append(myBalloon)
        }
    }

    @IBAction func nextButtonPressed(sender: AnyObject) {
        
        // Increment the index so the first button push (and subsequent pushes) changes the image
        currentIndex += 1
        
        self.balloonImage.image = balloonArray[currentIndex].image
        self.balloonsLabel.text = balloonArray[currentIndex].label
        
    }
}