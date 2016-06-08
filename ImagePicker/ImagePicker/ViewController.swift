//
//  ViewController.swift
//  ImagePicker
//
//  Created by Himanshu Pandey on 5/17/16.
//  Copyright © 2016 Himanshu Pandey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func execute()
    {
        let imagePicker = UIImagePickerController()
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }


}

