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
    let ENTITY_IMITATION_GAME = "BWImitationGame"
    let NAME_TEAM_A = "The Blues"
    let NAME_TEAM_B = "The Reds"
    
    var managedObjectContext: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        managedObjectContext = context
//        super.init()
    }
    
    func updateScore(isTeamA: Bool, points: Int){
    
        print("DAOTeam.updateScore isTeamA -> \(isTeamA)")
        
        let fetchRequest = NSFetchRequest(entityName: ENTITY_TEAM)
        
        do {
            
            let fetchResults = try self.managedObjectContext.executeFetchRequest(fetchRequest) as! [BWTeam]
            
            let bwTeams = fetchResults
            
            print("bwTeams.count --> \(bwTeams.count)")
            
            if(bwTeams.count > 0)  {
                
                let index = ((isTeamA) ? 0 : 1)
                let bwTeam = bwTeams[index]
                bwTeam.score = points
                print("bwTeam.name --> \(bwTeam.name)")
                print("bwTeam.score --> \(bwTeam.score)")
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

    func getTeams() -> [BWTeam]{
        
        print("*** DaoTeam.getTeams")
        
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
                
                print("*** DaoTeam.loadData team 01 -> \(bwTeam01.name)")
                print("*** DaoTeam.loadData team 02 -> \(bwTeam02.name)")
                getImitations()
                return [bwTeam01, bwTeam02]
            }
            
        }catch {
            print("*** getTeams Exception");
        }
        
        return []
    }
    
    
    func getImitations() -> [BWImitationGame]{
        
        print("*** DaoTeam.getImitations")
        
        let entityDescritpion = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME,
            inManagedObjectContext: self.managedObjectContext)
        
        let fetchRequest = NSFetchRequest(entityName: ENTITY_IMITATION_GAME)
        fetchRequest.entity = entityDescritpion
        
        do {
            
            let fetchResults = try self.managedObjectContext.executeFetchRequest(fetchRequest) as! [BWImitationGame]
            
            let bwImitations = fetchResults
            
            print("DaoTeam.getImitations bwImitations.count--> \(bwImitations.count)")
            
            if(bwImitations.count > 0)  {
                
                return bwImitations
                
//                let bwImitation01 = bwImitations[0]
//                let bwImitation02 = bwImitations[1]
//                
//                print("*** DaoTeam.loadData team 01 -> \(bwImitation01.imitation) --  \(bwImitation01.topic)")
//                print("*** DaoTeam.loadData team 02 -> \(bwImitation02.imitation) --  \(bwImitation02.topic)")
//                
//                return [bwImitation01, bwImitation02]
            }
            
        }catch {
            print("*** DaoTeam.getImitations Exception");
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
        
        // TEAM
        
        let eTeam01 = NSEntityDescription.entityForName(ENTITY_TEAM, inManagedObjectContext: managedObjectContext)
        let team01 = NSManagedObject(entity: eTeam01!, insertIntoManagedObjectContext: managedObjectContext)
        team01.setValue(1, forKey: "id")
        team01.setValue(NAME_TEAM_A, forKey: "name")
        team01.setValue(0, forKey: "score")
        team01.setValue(0, forKey: "isMorning")
        
        let eTeam02 = NSEntityDescription.entityForName(ENTITY_TEAM, inManagedObjectContext: managedObjectContext)
        let team02 = NSManagedObject(entity: eTeam02!, insertIntoManagedObjectContext: managedObjectContext)
        team02.setValue(2, forKey: "id")
        team02.setValue(NAME_TEAM_B, forKey: "name")
        team02.setValue(0, forKey: "score")
        team02.setValue(0, forKey: "isMorning")
        
        
        // IMITATION GAME
        
        let eImitation01 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation01 = NSManagedObject(entity: eImitation01!, insertIntoManagedObjectContext: managedObjectContext)
        imitation01.setValue(1, forKey: "id")
        imitation01.setValue("Smeagol", forKey: "imitation")
        imitation01.setValue("Personagem", forKey: "topic")
        
        let eImitation02 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation02 = NSManagedObject(entity: eImitation02!, insertIntoManagedObjectContext: managedObjectContext)
        imitation02.setValue(1, forKey: "id")
        imitation02.setValue("Mário Bross", forKey: "imitation")
        imitation02.setValue("Personagem", forKey: "topic")
        
        let eImitation03 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation03 = NSManagedObject(entity: eImitation03!, insertIntoManagedObjectContext: managedObjectContext)
        imitation03.setValue(1, forKey: "id")
        imitation03.setValue("Coringa", forKey: "imitation")
        imitation03.setValue("Personagem", forKey: "topic")
        
        let eImitation04 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation04 = NSManagedObject(entity: eImitation04!, insertIntoManagedObjectContext: managedObjectContext)
        imitation04.setValue(1, forKey: "id")
        imitation04.setValue("Batman", forKey: "imitation")
        imitation04.setValue("Personagem", forKey: "topic")
        
        let eImitation05 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation05 = NSManagedObject(entity: eImitation05!, insertIntoManagedObjectContext: managedObjectContext)
        imitation05.setValue(1, forKey: "id")
        imitation05.setValue("Hulk", forKey: "imitation")
        imitation05.setValue("Personagem", forKey: "topic")
        
        let eImitation06 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation06 = NSManagedObject(entity: eImitation06!, insertIntoManagedObjectContext: managedObjectContext)
        imitation06.setValue(1, forKey: "id")
        imitation06.setValue("Guia do mochileiro das galáxias", forKey: "imitation")
        imitation06.setValue("Filme", forKey: "topic")
        
        let eImitation07 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation07 = NSManagedObject(entity: eImitation07!, insertIntoManagedObjectContext: managedObjectContext)
        imitation07.setValue(1, forKey: "id")
        imitation07.setValue("Se beber não case", forKey: "imitation")
        imitation07.setValue("Filme", forKey: "topic")
        
        let eImitation08 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation08 = NSManagedObject(entity: eImitation08!, insertIntoManagedObjectContext: managedObjectContext)
        imitation08.setValue(1, forKey: "id")
        imitation08.setValue("Mad Max", forKey: "imitation")
        imitation08.setValue("Filme", forKey: "topic")

        do {
            try
                managedObjectContext.save()
            print("delegate save initializeBD")
            
        }catch {
            print("delegate exception save error")
        }
    }
}
