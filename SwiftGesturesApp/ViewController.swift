//
//  ViewController.swift
//  SwiftGesturesApp
//
//  Created by user on 8/11/14.
//  Copyright (c) 2014 someCompanyNameHere. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func handlePan(recognizer:UIPanGestureRecognizer)
    {
        //get a reference to view associated with the gesture
        let translation = recognizer.translationInView(self.view)
        
        //move the view based on the pan movement
        recognizer.view.center = CGPoint(x: recognizer.view.center.x + translation.x, y: recognizer.view.center.y + translation.y)
        
        //reset the translation
        recognizer.setTranslation(CGPointZero, inView: self.view)
    }

}

