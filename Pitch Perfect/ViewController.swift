//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Guilherme Paiva on 03/06/15.
//  Copyright (c) 2015 Guilherme Paiva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingInProgress: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
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
        recordButton.enabled = true
    }

    @IBAction func recordAudio(sender: UIButton) {
        recordingInProgress.hidden = false
        recordButton.enabled = false
    }
    
    @IBAction func stopAudio(sender: UIButton) {
        recordButton.enabled = true
        recordingInProgress.hidden = true
    }
   
    
}

