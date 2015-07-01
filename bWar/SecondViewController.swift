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
    @IBOutlet weak var resetTimeButton: UIButton!

    @IBOutlet weak var lbPointsT01: UILabel!
    @IBOutlet weak var lbPointsT02: UILabel!
    
    @IBOutlet weak var lbNameT01: UILabel!
    @IBOutlet weak var lbNameT02: UILabel!
    
    @IBOutlet weak var raffleMimeButton: UIButton!
    var timer: NSInteger = 60
    var clock: NSTimer?
    var counting: Bool = false
    
    let CONST_SCORE = 5
    
    lazy var daoTeam: BWDaoTeam = {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).daoTeam
        }()

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
        resetTimeButton.hidden = false

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
    
    @IBAction func resetTime(sender: AnyObject) {
        if (counting) {
            clock!.invalidate()
            clock = nil
        }

        timeLabel.text = "01:00"
        resetTimeButton.hidden = true;
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
        }

    }
    
    
    @IBAction func raffleMime(sender: AnyObject) {
        mimeLabel.text = "Mímica sorteada"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeView()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeView(){
        
        print("*** SecondViewController.initializeView")
        
        let bwTeams = self.daoTeam.getTeams()
        
        lbNameT01.text = bwTeams[0].name
        lbPointsT01.text = bwTeams[0].score?.stringValue
        
        lbNameT02.text = bwTeams[1].name
        lbPointsT02.text = bwTeams[1].score?.stringValue
    }
    
    @IBAction func incrementPoints(sender: AnyObject) {
        
        let isTeamA = (segmentControl.selectedSegmentIndex == 0)
        var points = 0
        
        print("SecondView.incrementPoints isTeamA -->\(isTeamA)")
        
        if (isTeamA) {
            points = (Int(lbPointsT01.text!)! + CONST_SCORE)
            lbPointsT01.text = "\(points)"
            
        } else {
            points = (Int(lbPointsT02.text!)! + CONST_SCORE)
            lbPointsT02.text = "\(points)"
        }
        
        self.daoTeam.updateScore(isTeamA, points: points)
    }
    
    // TODO: codigo comentado pois nao acontece nada se errar,
    // o codigo anterior retirava ponto
    @IBAction func decrementPoints(sender: AnyObject) {
        
        let isTeamA = (segmentControl.selectedSegmentIndex == 0)
//        var points = 0
        
        print("SecondView.decrementPoints isTeamA -->\(isTeamA)")
        
//        if (points >= 0) {
//            
//            if (isTeamA) {
//                points = (Int(lbPointsT01.text!)! - CONST_SCORE)
//                lbPointsT01.text = "\(points)"
//                
//            } else {
//                points = (Int(lbPointsT02.text!)! - CONST_SCORE)
//                lbPointsT02.text = "\(points)"
//            }
//            
//            self.daoTeam.updateScore(isTeamA, points: points)
//        }
    }
}

