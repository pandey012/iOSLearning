//
//  RockPaperScissor.swift
//  RockPaperScissor
//
//  Created by Himanshu Pandey on 5/17/16.
//  Copyright © 2016 Himanshu Pandey. All rights reserved.
//

import UIKit



enum Shape: String {
    
    case Rock = "Rock"
    case Paper  = "Paper"
    case Scissor = "Scissor"
    
    static func randomShape() -> Shape {
        let shapes = ["Rock", "Paper", "Scissor"]
        let randomChoice = Int(arc4random_uniform(3))
        return Shape(rawValue: shapes[randomChoice])!
    }
    
}


class RockPaperScissor : UIViewController{
    
    @IBOutlet private weak var resultImage: UIImageView!
    @IBOutlet private weak var resultLabel: UILabel!
    
    var userSelection : Shape!
    private let appChoice : Shape = Shape.randomShape()
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        displayResults()
        
    }
    
    
    func displayResults()
    {
        var image: String
        var text : String
        let match = "\(userSelection.rawValue) vs. \(appChoice.rawValue)"
        
        switch(userSelection! , appChoice)
        {
        case let (a, b) where a == b:
            text = "\(match): it's a tie!"
            image = "tie"
        case (.Rock, .Scissor), (.Paper, .Rock), (.Scissor, .Paper):
            text = "You win with \(match)!"
            image = "\(userSelection.rawValue)-\(appChoice.rawValue)"
        default:
            text = "You lose with \(match) :(."
            image = "\(appChoice.rawValue)-\(userSelection.rawValue)"

        }
        
        image = image.lowercaseString
        resultImage.image = UIImage(named: image)
        resultLabel.text = text
        
        
    }
    
    @IBAction func playAgain() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
  
}
