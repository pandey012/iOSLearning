//
//  PlayController.swift
//  RockPaperScissor
//
//  Created by Himanshu Pandey on 5/20/16.
//  Copyright © 2016 Himanshu Pandey. All rights reserved.
//

import UIKit

class PlayController : UIViewController{
    
    
    @IBAction func playRock(sender: UIButton )
    {
        performSegueWithIdentifier("showResults", sender: sender)
    }
    
   @IBAction func playPaper(sender: UIButton)
    {
         performSegueWithIdentifier("showResults", sender: sender)
    }
    
    
    @IBAction func playScissor(sender: UIButton)
    {
         performSegueWithIdentifier("showResults", sender: sender)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showResults" {
            let vc = segue.destinationViewController as! RockPaperScissor
            vc.userSelection = getUserShape(sender as! UIButton)
        }
    }
    
    private func getUserShape(sender: UIButton) -> Shape {
        // Titles are set to one of: Rock, Paper, or Scissors
        let shape = sender.titleForState(.Normal)!
        return Shape(rawValue: shape)!
    }
    
}


