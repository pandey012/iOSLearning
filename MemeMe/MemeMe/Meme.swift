//
//  Meme.swift
//  ImagePicker2.0
//
//  Created by Himanshu Pandey on 6/7/16.
//  Copyright © 2016 Himanshu Pandey. All rights reserved.
//

import Foundation
import UIKit

struct Meme{
    
    var topText:String
    var bottomText: String
    var image: UIImage
    var memeImage: UIImage
    
    init(topText: String, bottomText: String, image: UIImage, memeImage: UIImage)
    {
        self.topText = topText;
        self.bottomText = bottomText;
        self.image = image;
        self.memeImage = memeImage;
        
    }
    
}