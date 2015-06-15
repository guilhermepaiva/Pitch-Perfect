//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Guilherme Paiva on 03/06/15.
//  Copyright (c) 2015 Guilherme Paiva. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var recordingInProgress: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    var audioRecorder:AVAudioRecorder!
    var recordedAudio:RecordedAudio!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        // hide the stop button
        //stopButton.hidden = true
        recordButton.enabled = true
    }

    @IBAction func recordAudio(sender: UIButton) {
        //stopButton.hidden = false
        recordingInProgress.hidden = false
        recordButton.enabled = false
        
        //record the user's voice
        var dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
        //var currentDateTime = NSDate()
        //var formatter = NSDateFormatter()
        //formatter.dateFormat = "ddMMyyyy-HHmmss"
        //var recordingName = formatter.stringFromDate(currentDateTime) + ".wav"
        var recordingName = "my_audio.wav"
        var pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        println(filePath)
        
        //setup the audio session
        var session = AVAudioSession.sharedInstance()
        session.setCategory(AVAudioSessionCategoryPlayAndRecord, error: nil)
        //initialize and prepare the recorder
        audioRecorder = AVAudioRecorder(URL: filePath, settings: nil, error: nil)
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
        
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder!, successfully flag: Bool) {

        if (flag){
            recordedAudio = RecordedAudio()
            recordedAudio.filePathUrl = recorder.url
            recordedAudio.title = recorder.url.lastPathComponent
            
            //TODO: Step 2 - Move to the next scene aka perform segue
            self.performSegueWithIdentifier("stopRecording", sender: recordedAudio)
        }
        else{
            println("Recording was not successful")
            recordButton.enabled = true
            stopButton.hidden = true
        }
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "stopRecording"){
            let playSoundsVC: PlaySoundsViewController = segue.destinationViewController as! PlaySoundsViewController
            let data = sender as! RecordedAudio
            playSoundsVC.receivedAudio = data
        }
    }
    
    @IBAction func stopAudio(sender: UIButton) {
        recordButton.enabled = true
        recordingInProgress.hidden = true
        //TODO: stop recording the user's voice
        audioRecorder.stop()
        var audioSession = AVAudioSession.sharedInstance()
        audioSession.setActive(false, error: nil)
    }
   
    
}

