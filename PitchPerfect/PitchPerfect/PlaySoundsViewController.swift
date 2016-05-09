//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Himanshu Pandey on 4/29/16.
//  Copyright © 2016 Himanshu Pandey. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    
    var recordedAudioURL: NSURL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: NSTimer!
    

    
    enum ButtonType : Int{case Slow = 0,Fast=1, Chipmunk=2, Vader=3, Echo=4, Reverb=5 }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("PlaySoundsViewController loaded")
        setupAudio()
    }
    
    override func viewWillAppear(animated: Bool) {
        configureUI(.NotPlaying)
    }
    
    @IBAction func playSoundForButton(sender : UIButton)
    {
        
        print("play sound button pressed")
        
        switch (ButtonType(rawValue: sender.tag)!) {
        case .Slow:
          playSound(rate : 0.5)
        case .Fast:
          playSound(rate : 1.5)
        case .Chipmunk:
            playSound(pitch : 1000)
        case .Vader:
            playSound(pitch : -1000)
        case .Echo:
            playSound(echo : true)
        case .Reverb:
            playSound(reverb : true)

        }
        
        configureUI(.Playing)
    }
    
    @IBAction func stopButtonPressed(sender : UIButton)
    {
        print("stop Audio button pressed")
        stopAudio()
    }
    


}
