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
    
    
    private var bwTeamA: BWTeam = BWTeam()
    private var bwTeamB: BWTeam = BWTeam()
    
//    required init(coder aDecoder: NSCoder) {
////        self.bwTeamA = BWTeam()
////        self.bwTeamB = BWTeam()
//        super.init(coder: aDecoder)
//        self.loadData()
//    }
    
    
   
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
        self.saveRank(true, points: points! + CONST_SCORE)
    }

    @IBAction func decrementPointsTeam01(sender: AnyObject) {

        let points: Int? = Int(lbPointsT01.text!)
        
        if (points != 0) {
            lbPointsT01.text = "\(points! - CONST_SCORE)"
            self.saveRank(true, points: points! - CONST_SCORE)
        }
    }

    @IBAction func incrementPointsTeam02(sender: AnyObject) {
        let points: Int? = Int(lbPointsT02.text!)
        lbPointsT02.text = "\(points! + CONST_SCORE)"
        self.saveRank(false, points: points! + CONST_SCORE)
    }
    
    @IBAction func decrementPointsTeam02(sender: AnyObject) {
        
        let points: Int? = Int(lbPointsT02.text!)
        
        if (points != 0) {
            lbPointsT02.text = "\(points! - CONST_SCORE)"
            self.saveRank(false, points: points! - CONST_SCORE)
        }
    }
    
    func managedObject()->NSManagedObjectContext {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        return appDelegate.managedObjectContext
    }
    
    
    func saveRank(isTeamA: Bool, points: Int){

        let fetchRequest = NSFetchRequest(entityName: "BWTeam")

        do {

            let fetchResults = try managedObject().executeFetchRequest(fetchRequest) as! [BWTeam]

            let bwTeams = fetchResults

            if(bwTeams.count > 0)  {
                
                let index = ((isTeamA) ? 0 : 1)
                let bwTeam = bwTeams[index]
                bwTeam.score = points
            }

            do {
                try managedObject().save()
//                let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
//                delegate.saveContext()
                print("save Rank")

            }catch {
                print("exception save Rank error")
            }
            
        }catch {
            print("*** saveRank Exception");
        }
        
    }

    
    
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
                
//                self.bwTeamA.name = bwTeams[0].name
//                print("*** FirstViewController.loadData bwTeamA -> \(bwTeamA.name)")

                
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

