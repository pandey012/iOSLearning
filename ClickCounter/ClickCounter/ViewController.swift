//
//  ViewController.swift
//  ClickCounter
//
//  Created by Himanshu Pandey on 5/13/16.
//  Copyright © 2016 Himanshu Pandey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count = 0
    var label:UILabel!
    var label2:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Label
        let label = UILabel()
        label.frame = CGRectMake(150, 150, 60, 60)
        label.text = "0"
        self.view.addSubview(label)
        self.label = label
        
        
        let button = UIButton()
        button.frame = CGRectMake(150,250, 60, 60)
        button.setTitle("Click", forState: .Normal)
        button.setTitleColor(UIColor.blueColor(), forState: .Normal)
        self.view.addSubview(button)
        button.addTarget(self, action: #selector(ViewController.incrementCounter), forControlEvents: UIControlEvents.TouchUpInside)
        
        let decrementButton = UIButton()
        decrementButton.frame = CGRectMake(10,250, 100, 60)
        decrementButton.setTitle("Decrement", forState: .Normal)
        decrementButton.setTitleColor(UIColor.redColor(), forState: .Normal)
        self.view.addSubview(decrementButton)
        decrementButton.addTarget(self, action: #selector(ViewController.decrement), forControlEvents: UIControlEvents.TouchUpInside)
        
        
    }
    
    func incrementCounter()
    {
        self.count += 1
        self.label.text = "\(self.count)"
        
    }
    
    func decrement()
    {
        self.count -= 1
        self.label.text = "\(self.count)"
    }



}

