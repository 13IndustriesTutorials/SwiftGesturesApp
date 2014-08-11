//
//  ViewController.swift
//  SwiftGesturesApp
//
//  Created by user on 8/11/14.
//  Copyright (c) 2014 someCompanyNameHere. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
                            
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
        
        if recognizer.state == UIGestureRecognizerState.Ended
            
        {   //get the velocity of the pan
            let velocity = recognizer.velocityInView((self.view))
            
            //calcuate the magnitude
            let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
            
            let slideMultiplier = magnitude / 200
            
            let slideFactor = 0.1 * slideMultiplier
            
            //calcuate the final point
            var finalPoint = CGPoint(x: recognizer.view.center.x + (velocity.x * slideFactor), y: recognizer.view.center.y + (velocity.y * slideFactor))
            
            //make sure the final point is within the view
            finalPoint.x = min(max(finalPoint.x,0), self.view.bounds.size.width)
            finalPoint.y = min(max(finalPoint.y,0), self.view.bounds.size.height)
            
            //animate the view to slide to final position
            UIView.animateWithDuration(Double(slideFactor * 2), delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                //set the views final position at the end of the aninmation
                    recognizer.view.center = finalPoint
                }, completion: nil)
        }
    }
    
    @IBAction func handlePinch(recognizer:UIPinchGestureRecognizer)
    {
        recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform, recognizer.scale, recognizer.scale)
        
        //reset scale
        recognizer.scale = 1
    }
    
    @IBAction func handleRotate(recognizer:UIRotationGestureRecognizer)
    {
        recognizer.view.transform = CGAffineTransformRotate(recognizer.view.transform, recognizer.rotation)
        
        //reset rotation
        recognizer.rotation = 0
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer!, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer!) -> Bool {
        return true
    }
}





















