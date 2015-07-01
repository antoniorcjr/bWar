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
    
//    private var bwTeamA: BWTeam = BWTeam()
//    private var bwTeamB: BWTeam = BWTeam()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Default Initialization
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func incrementPointsTeam01(sender: AnyObject) {
        let points = (Int(lbPointsT01.text!)! + CONST_SCORE)
        lbPointsT01.text = "\(points)"
        self.saveRank(true, points: points)
    }

    @IBAction func decrementPointsTeam01(sender: AnyObject) {

        let points = (Int(lbPointsT01.text!)! - CONST_SCORE)
        
        if (points >= 0) {
            lbPointsT01.text = "\(points)"
            self.saveRank(true, points: points)
        }
    }

    @IBAction func incrementPointsTeam02(sender: AnyObject) {
        let points = (Int(lbPointsT02.text!)! + CONST_SCORE)
        lbPointsT02.text = "\(points)"
        self.saveRank(false, points: points)
    }
    
    @IBAction func decrementPointsTeam02(sender: AnyObject) {
        
        let points = (Int(lbPointsT02.text!)! - CONST_SCORE)
        
        if (points >= 0) {
            lbPointsT02.text = "\(points)"
            self.saveRank(false, points: points)
        }
    }
    
    func managedObject()->NSManagedObjectContext {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        return appDelegate.managedObjectContext
    }
    
    
    // MARK: - Mover p outra classe responsavel pela comunicacao com o BD
    
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
//                print("save Rank")

            }catch {
                print("exception saveRank Exception --> save")
            }
            
        }catch {
            print("*** saveRank Exception --> executeFetchRequest");
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

