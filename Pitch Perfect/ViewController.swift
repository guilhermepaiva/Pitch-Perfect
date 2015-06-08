//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Guilherme Paiva on 03/06/15.
//  Copyright (c) 2015 Guilherme Paiva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordinInProgress: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // IB stands for Interface Builder
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(sender: UIButton) {
        // TODO Show text "recording in progress"
        // TODO Record the user's voice
       
        println("in recordAudio")
    }

}

