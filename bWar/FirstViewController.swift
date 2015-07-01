//
//  FirstViewController.swift
//  bWar
//
//  Created by Antonio de Carvalho Jr on 6/25/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import UIKit
import CoreData

class FirstViewController: UIViewController {

    @IBOutlet weak var lbNameT01: UILabel!
    @IBOutlet weak var lbPointsT01: UILabel!
    @IBOutlet weak var lbNameT02: UILabel!
    @IBOutlet weak var lbPointsT02: UILabel!
    
    lazy var daoTeam: BWDaoTeam = {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).daoTeam
        }()
    
    let CONST_SCORE = 5
    
//    private var bwTeamA: BWTeam = BWTeam()
//    private var bwTeamB: BWTeam = BWTeam()
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        initializeView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func incrementPointsTeam01(sender: AnyObject) {
        let points = (Int(lbPointsT01.text!)! + CONST_SCORE)
        lbPointsT01.text = "\(points)"
        self.daoTeam.updateScore(true, points: points)
    }

    @IBAction func decrementPointsTeam01(sender: AnyObject) {

        let points = (Int(lbPointsT01.text!)! - CONST_SCORE)
        
        if (points >= 0) {
            lbPointsT01.text = "\(points)"
            self.daoTeam.updateScore(true, points: points)
        }
    }

    @IBAction func incrementPointsTeam02(sender: AnyObject) {
        let points = (Int(lbPointsT02.text!)! + CONST_SCORE)
        lbPointsT02.text = "\(points)"
        self.daoTeam.updateScore(false, points: points)
    }
    
    @IBAction func decrementPointsTeam02(sender: AnyObject) {
        
        let points = (Int(lbPointsT02.text!)! - CONST_SCORE)
        
        if (points >= 0) {
            lbPointsT02.text = "\(points)"
            self.daoTeam.updateScore(false, points: points)
        }
    }

    func initializeView(){
        
        print("*** FirstViewController.loadData")
        
        let bwTeams = self.daoTeam.getTeams()
        
        lbNameT01.text = bwTeams[0].name
        lbPointsT01.text = bwTeams[0].score?.stringValue
        
        lbNameT02.text = bwTeams[1].name
        lbPointsT02.text = bwTeams[1].score?.stringValue
    }
}

