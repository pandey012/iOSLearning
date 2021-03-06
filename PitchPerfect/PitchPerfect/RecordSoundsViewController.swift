//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Himanshu Pandey on 4/22/16.
//  Copyright © 2016 Himanshu Pandey. All rights reserved.
//

import UIKit
import AVFoundation


class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    

    @IBOutlet weak var recordButton: UIButton!
    
    
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    
    @IBOutlet weak var recordingLabel: UILabel!
    
    var audioRecorder:AVAudioRecorder!
    

    @IBAction func RecordAudio(sender: AnyObject) {
        
        print("record button pressed")
        
        setState(false, stopFlag: true,label: "Recording in progress" )
        
        // Record Audio Code
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)[0] as String
        let recordingName = "myAudio.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
        // Record Audio Code
    }

    @IBAction func StopRecording(sender: AnyObject){

        setState(true, stopFlag: false,label: "Tap to Record" )
        
        //Stop Recording
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        
        
        
        //Stop Recording
        
       
    }
    
    override func viewWillAppear(animated: Bool) {
        stopRecordingButton.enabled = false
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        
        print("AVrecorder finished saving recording")
        if(flag)
        {
            self.performSegueWithIdentifier("stopRecording", sender: audioRecorder.url)
            
            
        }
        else{
            print("recording failed")
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "stopRecording") {
            let playSoundsVC = segue.destinationViewController as! PlaySoundsViewController
            let recordedAudioURL = sender as! NSURL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }
    
    func setState(startFlag: Bool, stopFlag: Bool, label: String )
    {
        recordButton.enabled = startFlag
        stopRecordingButton.enabled = stopFlag
        recordingLabel.text = label
    }
    
}

