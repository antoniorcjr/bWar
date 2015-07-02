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
    
    @IBOutlet weak var lbQuestion: UILabel!
    @IBOutlet weak var lbAnswer: UILabel!
    
    @IBOutlet weak var lbNameT01: UILabel!
    @IBOutlet weak var lbPointsT01: UILabel!
    
    @IBOutlet weak var lbNameT02: UILabel!
    @IBOutlet weak var lbPointsT02: UILabel!
    
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
    
    @IBAction func raffleQuestion(sender: AnyObject) {
        print("raffleQuestion")
        let questions = daoTeam.getQuestions()
        let randomNumber = Int(arc4random_uniform(21))
        
        print("question random -> \(randomNumber)")
        
        lbQuestion.text = questions[randomNumber].question
        lbAnswer.text = questions[randomNumber].answer
        lbAnswer.hidden = true;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeView(){
        print("*** FourthViewController.initializeView")
        UtilViewController().initializeView(self.lbNameT01, lbPointsT01: lbPointsT01,
            lbNameT02: lbNameT02, lbPointsT02: lbPointsT02)
        
        lbQuestion.text = "?"
        lbAnswer.text = "?"
        lbAnswer.hidden = true;
    }
    @IBAction func showAnswer(sender: AnyObject) {
        lbAnswer.hidden = false;
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