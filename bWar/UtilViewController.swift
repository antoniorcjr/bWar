//
//  UtilViewController.swift
//  bWar
//
//  Created by Adriana Izel on 7/1/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import Foundation
import UIKit

class UtilViewController {

    let CONST_SCORE = 5
    
    lazy var daoTeam: BWDaoTeam = {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).daoTeam
        }()
    
    func initializeView(lbNameT01: UILabel, lbPointsT01: UILabel,
        lbNameT02: UILabel, lbPointsT02: UILabel){
        
        print("*** UtilViewController.initializeView")
        
        let bwTeams = self.daoTeam.getTeams()
        
        lbNameT01.text = bwTeams[0].name
        lbPointsT01.text = bwTeams[0].score?.stringValue
        
        lbNameT02.text = bwTeams[1].name
        lbPointsT02.text = bwTeams[1].score?.stringValue
    }
    
    func incrementPoints(lbPoints: UILabel, isTeamA: Bool) {
        
        let points = (Int(lbPoints.text!)! + CONST_SCORE)
        lbPoints.text = "\(points)"
        
        self.daoTeam.updateScore(isTeamA, points: points)
    }
    
    // TODO: codigo comentado pois nao acontece nada se errar,
    // o codigo anterior retirava ponto
    func decrementPoints(lbPoints: UILabel, isTeamA: Bool) {
        
        let points = (Int(lbPoints.text!)! - CONST_SCORE)
        if (points >= 0) {
            lbPoints.text = "\(points)"
            self.daoTeam.updateScore(isTeamA, points: points)
        }
    }
}