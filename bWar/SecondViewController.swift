//
//  SecondViewController.swift
//  bWar
//
//  Created by Antonio de Carvalho Jr on 6/25/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var backgroundTeam: UIImageView!
    @IBOutlet weak var teamLabel: UILabel!
    
    @IBOutlet weak var mimeLabel: UILabel!

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeButton: UIButton!

    @IBOutlet weak var raffleMimeButton: UIButton!
    var timer: NSInteger = 60
    var clock: NSTimer?
    var counting: Bool = false

    @IBAction func indexChanged(sender: AnyObject) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            backgroundTeam.image = UIImage(named: "bgAzul")
            teamLabel.text = "Team 1";
        case 1:
            backgroundTeam.image = UIImage(named: "backGroundDuplo")
            teamLabel.text = "Team 2";
        default:
            break; 
        }
    }

    
    @IBAction func startTime(sender: AnyObject) {
        if (!counting) {
            clock = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "countdown", userInfo: nil, repeats: true)
            segmentControl.enabled = false
            raffleMimeButton.enabled = false
            //timeButton.setTitle("PAUSAR", forState: UIControlState.Normal)
            counting = true
        } else {
            clock!.invalidate()
            clock = nil
            //timeButton.setTitle("INICIAR", forState: UIControlState.Normal)
            counting = false
        }
    }
    
    func countdown() {
        timer--
        if(timer >= 0) {
            if (timer > 9) {
                timeLabel.text = String(format: "00:%d", timer)
            } else {
                timeLabel.text = String(format: "00:0%d", timer)
            }
        } else {
            clock!.invalidate()
            clock = nil
            timer = 60
            segmentControl.enabled = true
            timeButton.enabled = true
            raffleMimeButton.enabled = true
            timer = 60
        }

    }
    
    
    @IBAction func raffleMime(sender: AnyObject) {
        mimeLabel.text = "Mímica sorteada"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

