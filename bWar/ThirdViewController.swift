//
//  ThirdViewController.swift
//  bWar
//
//  Created by Adriana Izel on 6/25/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var lbJoking: UILabel!
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var lbNameT01: UILabel!
    @IBOutlet weak var lbPointsT01: UILabel!
    
    @IBOutlet weak var lbNameT02: UILabel!
    @IBOutlet weak var lbPointsT02: UILabel!
    
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var okButton: UIButton!
    
    @IBAction func indexChanged(sender: AnyObject) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            background.image = UIImage(named: "bgAzul")
        case 1:
            background.image = UIImage(named: "bgVermelho")
        default:
            break;
        }
    }
    
    lazy var daoTeam: BWDaoTeam = {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).daoTeam
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(animated: Bool) {
        initializeView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeView(){
        print("*** ThirdViewController.initializeView")
        UtilViewController().initializeView(self.lbNameT01, lbPointsT01: lbPointsT01,
            lbNameT02: lbNameT02, lbPointsT02: lbPointsT02)
    }
    
    @IBAction func raffleJoking(sender: AnyObject) {
        okButton.enabled = true
        noButton.enabled = true
        segmentControl.enabled = true
        print("raffleJoking")
        let imitations = daoTeam.getJokings()
        let randomNumber = Int(arc4random_uniform(10))
        
        print("joking random -> \(randomNumber)")
        
        lbJoking.text = imitations[randomNumber].joking
    }
    
    @IBAction func incrementPoints(sender: AnyObject) {
        okButton.enabled = false
        noButton.enabled = false
        segmentControl.enabled = true
        lbJoking.text = "?"
        let isTeamA = (segmentControl.selectedSegmentIndex == 0)
        UtilViewController().incrementPoints((isTeamA ? lbPointsT01 : lbPointsT02), isTeamA: isTeamA)
    }
    
    // TODO: codigo comentado pois nao acontece nada se errar,
    // o codigo anterior retirava ponto
    @IBAction func decrementPoints(sender: AnyObject) {
        okButton.enabled = false
        noButton.enabled = false
        segmentControl.enabled = true
        lbJoking.text = "?"
        //        let isTeamA = (segmentControl.selectedSegmentIndex == 0)
        //        UtilViewController().decrementPoints((isTeamA ? lbPointsT01 : lbPointsT02), isTeamA: isTeamA)
    }
    
}