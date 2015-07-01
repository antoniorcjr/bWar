//
//  FourthViewController.swift
//  bWar
//
//  Created by Adriana Izel on 6/25/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var lbNameT01: UILabel!
    @IBOutlet weak var lbPointsT01: UILabel!
    
    @IBOutlet weak var lbNameT02: UILabel!
    @IBOutlet weak var lbPointsT02: UILabel!
    
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
        print("*** SecondViewController.initializeView")
        UtilViewController().initializeView(self.lbNameT01, lbPointsT01: lbPointsT01,
            lbNameT02: lbNameT02, lbPointsT02: lbPointsT02)
    }

    @IBAction func incrementPoints(sender: AnyObject) {
        let isTeamA = (segmentControl.selectedSegmentIndex == 0)
        UtilViewController().incrementPoints((isTeamA ? lbPointsT01 : lbPointsT02), isTeamA: isTeamA)
    }

    // TODO: codigo comentado pois nao acontece nada se errar,
    // o codigo anterior retirava ponto
    @IBAction func decrementPoints(sender: AnyObject) {
        //        let isTeamA = (segmentControl.selectedSegmentIndex == 0)
        //        UtilViewController().decrementPoints((isTeamA ? lbPointsT01 : lbPointsT02), isTeamA: isTeamA)
    }
    
}