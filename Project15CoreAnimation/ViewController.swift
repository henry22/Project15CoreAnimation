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
        //cycle through animations each time the button is tapped
        ++currentAnimation
        
        if currentAnimation > 7 {
            currentAnimation = 0
        }
    }

}

