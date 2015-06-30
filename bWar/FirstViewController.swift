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
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Default Initialization
        lbNameT01.text = "Time A"
        lbPointsT01.text = "0"
        
        lbNameT02.text = "Time B"
        lbPointsT02.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func incrementPointsTeam01(sender: AnyObject) {
        let value: Int? = Int(lbPointsT01.text!)
        lbPointsT01.text = "\(value! + 10)"
        
        
    }

    @IBAction func decrementPointsTeam01(sender: AnyObject) {
        let value: Int? = Int(lbPointsT01.text!)
        if (value != 0) {
            lbPointsT01.text = "\(value! - 10)"
        }
    }

    @IBAction func incrementPointsTeam02(sender: AnyObject) {
        let value: Int? = Int(lbPointsT02.text!)
        lbPointsT02.text = "\(value! + 10)"
    }
    
    @IBAction func decrementPointsTeam02(sender: AnyObject) {
        let value: Int? = Int(lbPointsT02.text!)
        
        if (value != 0) {
            lbPointsT02.text = "\(value! - 10)"
        }
    }
    
    func managedObject()->NSManagedObjectContext {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        return appDelegate.managedObjectContext
    }
    
//    
//    func saveRank(){
//
//        let fetchRequest = NSFetchRequest(entityName: "BWTeam")
//        
//        let fetchResults = try managedObject().executeFetchRequest(fetchRequest) as! [BWTeam]
//    
//            if let bwTeams = fetchResults {
//                let bwTeam01 = bwTeams[0]
//            }
//            
//        }catch {
//            NSLog("exception");
//        }
//        
//    }
}

