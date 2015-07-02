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

    @IBOutlet weak var lbPointsT01: UILabel!
    @IBOutlet weak var lbPointsT02: UILabel!
    
    @IBOutlet weak var lbNameT01: UILabel!
    @IBOutlet weak var lbNameT02: UILabel!
    @IBOutlet weak var lbTopic: UILabel!
    
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var raffleMimeButton: UIButton!
    var timer: NSInteger = 60
    var clock: NSTimer?
    var counting: Bool = false
    var hasMime: Bool = false
    
    lazy var daoTeam: BWDaoTeam = {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).daoTeam
        }()
    

    @IBAction func indexChanged(sender: AnyObject) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            backgroundTeam.image = UIImage(named: "bgAzul")
            teamLabel.text = "Team 1";
        case 1:
            backgroundTeam.image = UIImage(named: "bgVermelho")
            teamLabel.text = "Team 2";
        default:
            break; 
        }
    }

    
    @IBAction func startTime(sender: AnyObject) {
        okButton.enabled = true
        noButton.enabled = true
        
        if (!counting) {
            clock = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "countdown", userInfo: nil, repeats: true)
            segmentControl.enabled = false
            raffleMimeButton.enabled = false
            counting = true
        } else {
            clock!.invalidate()
            clock = nil
            counting = false
        }
    }
    
    func resetTime() {
        if (counting) {
            clock!.invalidate()
            clock = nil
        }

        timeLabel.text = "01:00"
        segmentControl.enabled = true
        raffleMimeButton.enabled = true
        counting = false
        timer = 60
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
            counting = false
        }

    }
    
    
    @IBAction func raffleMime(sender: AnyObject) {
        timeButton.enabled = true
        hasMime = true

        let imitations = daoTeam.getImitations()
        let randomNumber = Int(arc4random_uniform(29))
        
        print("raffleMime randon -> \(randomNumber)")
        
        mimeLabel.text = imitations[randomNumber].imitation
        lbTopic.text = imitations[randomNumber].topic
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        okButton.enabled = false
        noButton.enabled = false
    }

    override func viewWillAppear(animated: Bool) {
        initializeView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeView(){
        print("*** SecondViewController.initializeView")
        UtilViewController().initializeView(self.lbNameT01, lbPointsT01: lbPointsT01,
            lbNameT02: lbNameT02, lbPointsT02: lbPointsT02)
    }
    
    @IBAction func incrementPoints(sender: AnyObject) {
        okButton.enabled = false
        noButton.enabled = false
        timeButton.enabled = false
        resetTime()
        mimeLabel.text = "?"
        let isTeamA = (segmentControl.selectedSegmentIndex == 0)
        UtilViewController().incrementPoints((isTeamA ? lbPointsT01 : lbPointsT02), isTeamA: isTeamA)
    }
    
    // TODO: codigo comentado pois nao acontece nada se errar,
    // o codigo anterior retirava ponto
    @IBAction func decrementPoints(sender: AnyObject) {
        okButton.enabled = false
        noButton.enabled = false
        timeButton.enabled = false
        resetTime()
        mimeLabel.text = "?"
//        let isTeamA = (segmentControl.selectedSegmentIndex == 0)
//        UtilViewController().decrementPoints((isTeamA ? lbPointsT01 : lbPointsT02), isTeamA: isTeamA)
    }
}

