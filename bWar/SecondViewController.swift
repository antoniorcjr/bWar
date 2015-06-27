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
    
    @IBOutlet weak var teamLabel: UILabel!
    
    @IBOutlet weak var mimeLabel: UILabel!

    @IBAction func indexChanged(sender: AnyObject) {
        switch segmentControl.selectedSegmentIndex
        {
        case 0:
            teamLabel.text = "Team 1";
        case 1:
            teamLabel.text = "Team 2";
        default:
            break; 
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

