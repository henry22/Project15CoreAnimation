//
//  ViewController.swift
//  Project15CoreAnimation
//
//  Created by Henry on 6/22/15.
//  Copyright (c) 2015 Henry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tap: UIButton!
    
    var imageView: UIImageView!
    var currentAnimation = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(image: UIImage(named: "penguin"))
        imageView.center = CGPoint(x: 512, y: 384)
        view.addSubview(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapped(sender: AnyObject) {
        //When the method begins, hide the tap button so that the animations don't collide
        tap.hidden = true
        
        //call animateWithDuration() with a duration of 1 second, no delay, and no interesting options
        UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .allZeros,
            //For the animations closure first do the [unowned self] in to avoid strong reference cycles, then enter the switch/case code
            animations: { [unowned self] in
            //switch using the value of self.currentAnimation, use self to make the closure capture clear
            switch self.currentAnimation {
            case 0:
                // make the view 2x its default size
                self.imageView.transform = CGAffineTransformMakeScale(2, 2)
            case 1:
                //clears our view of any pre-defined transform, resetting any changes
                self.imageView.transform = CGAffineTransformIdentity
            case 2:
                //subtracts 256 from both the current X and Y position
                self.imageView.transform = CGAffineTransformMakeTranslation(-256, -256)
            case 3:
                self.imageView.transform = CGAffineTransformIdentity
            case 4:
                self.imageView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
            case 5:
                self.imageView.transform = CGAffineTransformIdentity
            case 6:
                //modify its transparency
                self.imageView.alpha = 0.1
                self.imageView.backgroundColor = UIColor.greenColor()
            case 7:
                self.imageView.alpha = 1
                self.imageView.backgroundColor = UIColor.clearColor()
            default:
                break
            }
                //use trailing closure syntax to provide the completion closure, this will be called when the animation completes, and its finished will be true if the animations completed fully
            }) { [unowned self] (finished: Bool) in
                //the completion closure unhides the tap button so it can be tapped again
                self.tap.hidden = false
        }
        
        //cycle through animations each time the button is tapped
        ++currentAnimation
        
        if currentAnimation > 7 {
            currentAnimation = 0
        }
    }

}

