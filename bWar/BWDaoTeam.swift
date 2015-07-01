//
//  BWDaoTeam.swift
//  bWar
//
//  Created by Adriana Izel on 7/1/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import Foundation
import CoreData

class BWDaoTeam {
    
    let ENTITY_TEAM = "BWTeam"
    
    var managedObjectContext: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        managedObjectContext = context
//        super.init()
    }
    
    func updateScore(isTeamA: Bool, points: Int){
    
        print("DAOTeam.updateScore")
        
        let fetchRequest = NSFetchRequest(entityName: ENTITY_TEAM)
        
        do {
            
            let fetchResults = try self.managedObjectContext.executeFetchRequest(fetchRequest) as! [BWTeam]
            
            let bwTeams = fetchResults
            
            if(bwTeams.count > 0)  {
                
                let index = ((isTeamA) ? 0 : 1)
                let bwTeam = bwTeams[index]
                bwTeam.score = points
            }
            
            do {
                try self.managedObjectContext.save()
                
            }catch {
                print("exception saveRank Exception --> save")
            }
            
        }catch {
            print("*** saveRank Exception --> executeFetchRequest");
        }
        
    }

    func loadData() -> [BWTeam]{
        
        print("*** DaoTeam.loadData")
        
        let entityDescritpion = NSEntityDescription.entityForName(ENTITY_TEAM,
            inManagedObjectContext: self.managedObjectContext)
        
        let fetchRequest = NSFetchRequest(entityName: ENTITY_TEAM)
        fetchRequest.entity = entityDescritpion
        
        do {
            
            let fetchResults = try self.managedObjectContext.executeFetchRequest(fetchRequest) as! [BWTeam]
            
            let bwTeams = fetchResults
            
            print("DaoTeam.loadData bwTeams.count--> \(bwTeams.count)")
            
            if(bwTeams.count > 0)  {
                
                let bwTeam01 = bwTeams[0]
                let bwTeam02 = bwTeams[1]
                
                //                self.bwTeamA.name = bwTeams[0].name
                //                print("*** FirstViewController.loadData bwTeamA -> \(bwTeamA.name)")
                
                
                print("*** DaoTeam.loadData team 01 -> \(bwTeam01.name)")
                print("*** DaoTeam.loadData team 02 -> \(bwTeam02.name)")
                
                return [bwTeam01, bwTeam02]
            }
            
        }catch {
            print("*** FirstViewController.loadData Exception");
        }
        
        return []
    }

    //TODO: retirar isso, vê metodo da API pra fazer isso (hasBD?)
    func hasDataBase()->Bool{
        
        print("DaoTeam")
        
        let entityDescritpion = NSEntityDescription.entityForName(ENTITY_TEAM,
            inManagedObjectContext: self.managedObjectContext)
        
        let fetchRequest = NSFetchRequest(entityName: ENTITY_TEAM)
        fetchRequest.entity = entityDescritpion
        
        do {
            
            let fetchResults = try self.managedObjectContext.executeFetchRequest(fetchRequest) as! [BWTeam]
            let bwTeams = fetchResults
            
            if(bwTeams.count > 0)  {
                return true
            }
            
        }catch {
            print("DaoTeam hasDataBase Exception");
        }
        
        return false
    }
    
    func initializeBD(){
        
        print("DaoTeam initializeBD()")
        
        // MORNING TEAM
        
        let entity01 = NSEntityDescription.entityForName(ENTITY_TEAM, inManagedObjectContext: managedObjectContext)
        let bwTeam01 = NSManagedObject(entity: entity01!, insertIntoManagedObjectContext: managedObjectContext)
        
        bwTeam01.setValue(1, forKey: "id")
        bwTeam01.setValue("The Blues", forKey: "name")
        bwTeam01.setValue(0, forKey: "score")
        bwTeam01.setValue(0, forKey: "isMorning")

        
        let entity02 = NSEntityDescription.entityForName(ENTITY_TEAM, inManagedObjectContext: managedObjectContext)
        let bwTeam02 = NSManagedObject(entity: entity02!, insertIntoManagedObjectContext: managedObjectContext)
        
        bwTeam02.setValue(2, forKey: "id")
        bwTeam02.setValue("The Reds", forKey: "name")
        bwTeam02.setValue(0, forKey: "score")
        bwTeam02.setValue(0, forKey: "isMorning")
        
        do {
            try
                managedObjectContext.save()
            print("delegate save initializeBD")
            
        }catch {
            print("delegate exception save error")
        }
    }
}
