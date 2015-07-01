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
    
    let CONST_SCORE = 5
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Default Initialization
//        lbNameT01.text = "Time A"
//        lbPointsT01.text = "0"
//        
//        lbNameT02.text = "Time B"
//        lbPointsT02.text = "0"
        
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func incrementPointsTeam01(sender: AnyObject) {
        let points: Int? = Int(lbPointsT01.text!)
        lbPointsT01.text = "\(points! + CONST_SCORE)"
    }

    @IBAction func decrementPointsTeam01(sender: AnyObject) {

        let points: Int? = Int(lbPointsT01.text!)
        
        if (points != 0) {
            lbPointsT01.text = "\(points! - CONST_SCORE)"
        }
    }

    @IBAction func incrementPointsTeam02(sender: AnyObject) {
        let points: Int? = Int(lbPointsT02.text!)
        lbPointsT02.text = "\(points! + CONST_SCORE)"
    }
    
    @IBAction func decrementPointsTeam02(sender: AnyObject) {
        
        let points: Int? = Int(lbPointsT02.text!)
        
        if (points != 0) {
            lbPointsT02.text = "\(points! - CONST_SCORE)"
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
    
    
    
    func loadData(){
        
        print("*** FirstViewController.loadData")
        
        let entityDescritpion = NSEntityDescription.entityForName("BWTeam", inManagedObjectContext: self.managedObject())
        
        let fetchRequest = NSFetchRequest(entityName: "BWTeam")
        fetchRequest.entity = entityDescritpion
        
        do {
            
            let fetchResults = try managedObject().executeFetchRequest(fetchRequest) as! [BWTeam]
            
            let bwTeams = fetchResults
            
            print("FirstViewController.loadData bwTeams.count--> \(bwTeams.count)")
            
            if(bwTeams.count > 0)  {
                
                let bwTeam01 = bwTeams[0]
                let bwTeam02 = bwTeams[1]
                
                print("*** FirstViewController.loadData team 01 -> \(bwTeam01.name)")
                print("*** FirstViewController.loadData team 02 -> \(bwTeam02.name)")
                
                lbNameT01.text = bwTeam01.name
                lbPointsT01.text = bwTeam01.score?.stringValue
                
                lbNameT02.text = bwTeam02.name
                lbPointsT02.text = bwTeam02.score?.stringValue
            }
            
        }catch {
            print("*** FirstViewController.loadData Exception");
        }
    }
}

