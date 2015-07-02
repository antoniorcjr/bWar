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
    let ENTITY_JOKING_GAME = "BWJoking"
    
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
                
//                let bwTeam01 = bwTeams[0]
//                let bwTeam02 = bwTeams[1]
//                
//                print("*** DaoTeam.loadData team 01 -> \(bwTeam01.name)")
//                print("*** DaoTeam.loadData team 02 -> \(bwTeam02.name)")

                return bwTeams//[bwTeam01, bwTeam02]
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
            }
            
        }catch {
            print("*** DaoTeam.getImitations Exception");
        }
        
        return []
    }
    
    func getJokings() -> [BWJoking]{
        
        print("*** DaoTeam.getImitations")
        
        let entityDescritpion = NSEntityDescription.entityForName(ENTITY_JOKING_GAME,
            inManagedObjectContext: self.managedObjectContext)
        
        let fetchRequest = NSFetchRequest(entityName: ENTITY_JOKING_GAME)
        fetchRequest.entity = entityDescritpion
        
        do {
            
            let fetchResults = try self.managedObjectContext.executeFetchRequest(fetchRequest) as! [BWJoking]
            
            let bwJokings = fetchResults
            
            print("DaoTeam.getJokings bwImitations.count--> \(bwJokings.count)")
            
            if(bwJokings.count > 0)  {
                return bwJokings
            }
            
        }catch {
            print("*** DaoTeam.getJokings Exception");
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
        imitation02.setValue(2, forKey: "id")
        imitation02.setValue("Mário Bross", forKey: "imitation")
        imitation02.setValue("Personagem", forKey: "topic")
        
        let eImitation03 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation03 = NSManagedObject(entity: eImitation03!, insertIntoManagedObjectContext: managedObjectContext)
        imitation03.setValue(3, forKey: "id")
        imitation03.setValue("Coringa", forKey: "imitation")
        imitation03.setValue("Personagem", forKey: "topic")
        
        let eImitation04 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation04 = NSManagedObject(entity: eImitation04!, insertIntoManagedObjectContext: managedObjectContext)
        imitation04.setValue(4, forKey: "id")
        imitation04.setValue("Batman", forKey: "imitation")
        imitation04.setValue("Personagem", forKey: "topic")
        
        let eImitation05 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation05 = NSManagedObject(entity: eImitation05!, insertIntoManagedObjectContext: managedObjectContext)
        imitation05.setValue(5, forKey: "id")
        imitation05.setValue("Hulk", forKey: "imitation")
        imitation05.setValue("Personagem", forKey: "topic")
        
        let eImitation06 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation06 = NSManagedObject(entity: eImitation06!, insertIntoManagedObjectContext: managedObjectContext)
        imitation06.setValue(6, forKey: "id")
        imitation06.setValue("Guia do mochileiro das galáxias", forKey: "imitation")
        imitation06.setValue("Filme", forKey: "topic")
        
        let eImitation07 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation07 = NSManagedObject(entity: eImitation07!, insertIntoManagedObjectContext: managedObjectContext)
        imitation07.setValue(7, forKey: "id")
        imitation07.setValue("Se beber não case", forKey: "imitation")
        imitation07.setValue("Filme", forKey: "topic")
        
        let eImitation08 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation08 = NSManagedObject(entity: eImitation08!, insertIntoManagedObjectContext: managedObjectContext)
        imitation08.setValue(8, forKey: "id")
        imitation08.setValue("Mad Max", forKey: "imitation")
        imitation08.setValue("Filme", forKey: "topic")
        
        let eImitation09 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation09 = NSManagedObject(entity: eImitation09!, insertIntoManagedObjectContext: managedObjectContext)
        imitation09.setValue(9, forKey: "id")
        imitation09.setValue("Jurassic World", forKey: "imitation")
        imitation09.setValue("Filme", forKey: "topic")
        
        let eImitation10 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation10 = NSManagedObject(entity: eImitation10!, insertIntoManagedObjectContext: managedObjectContext)
        imitation10.setValue(10, forKey: "id")
        imitation10.setValue("American Pie", forKey: "imitation")
        imitation10.setValue("Filme", forKey: "topic")
        
        let eImitation11 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation11 = NSManagedObject(entity: eImitation11!, insertIntoManagedObjectContext: managedObjectContext)
        imitation11.setValue(11, forKey: "id")
        imitation11.setValue("Bambi", forKey: "imitation")
        imitation11.setValue("Filme", forKey: "topic")
        
        let eImitation12 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation12 = NSManagedObject(entity: eImitation12!, insertIntoManagedObjectContext: managedObjectContext)
        imitation12.setValue(12, forKey: "id")
        imitation12.setValue("ET", forKey: "imitation")
        imitation12.setValue("Filme", forKey: "topic")
        
        let eImitation13 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation13 = NSManagedObject(entity: eImitation13!, insertIntoManagedObjectContext: managedObjectContext)
        imitation13.setValue(13, forKey: "id")
        imitation13.setValue("Angry Birds", forKey: "imitation")
        imitation13.setValue("Game", forKey: "topic")
        
        let eImitation14 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation14 = NSManagedObject(entity: eImitation14!, insertIntoManagedObjectContext: managedObjectContext)
        imitation14.setValue(14, forKey: "id")
        imitation14.setValue("Street Fighter", forKey: "imitation")
        imitation14.setValue("Game", forKey: "topic")
        
        let eImitation15 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation15 = NSManagedObject(entity: eImitation15!, insertIntoManagedObjectContext: managedObjectContext)
        imitation15.setValue(15, forKey: "id")
        imitation15.setValue("Pac Man", forKey: "imitation")
        imitation15.setValue("Game", forKey: "topic")
        
        let eImitation16 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation16 = NSManagedObject(entity: eImitation16!, insertIntoManagedObjectContext: managedObjectContext)
        imitation16.setValue(16, forKey: "id")
        imitation16.setValue("Sonic", forKey: "imitation")
        imitation16.setValue("Game", forKey: "topic")
        
        let eImitation17 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation17 = NSManagedObject(entity: eImitation17!, insertIntoManagedObjectContext: managedObjectContext)
        imitation17.setValue(17, forKey: "id")
        imitation17.setValue("American Pie", forKey: "imitation")
        imitation17.setValue("Filme", forKey: "topic")
        
        let eImitation18 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation18 = NSManagedObject(entity: eImitation18!, insertIntoManagedObjectContext: managedObjectContext)
        imitation18.setValue(18, forKey: "id")
        imitation18.setValue("Gangnam Style", forKey: "imitation")
        imitation18.setValue("Música", forKey: "topic")
        
        let eImitation19 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation19 = NSManagedObject(entity: eImitation19!, insertIntoManagedObjectContext: managedObjectContext)
        imitation19.setValue(19, forKey: "id")
        imitation19.setValue("Single Ladies (Beyonce)", forKey: "imitation")
        imitation19.setValue("Música", forKey: "topic")
        
        let eImitation20 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation20 = NSManagedObject(entity: eImitation20!, insertIntoManagedObjectContext: managedObjectContext)
        imitation20.setValue(20, forKey: "id")
        imitation20.setValue("Faroeste Cabloco (Legião Urbana)", forKey: "imitation")
        imitation20.setValue("Música", forKey: "topic")
        
        let eImitation21 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation21 = NSManagedObject(entity: eImitation21!, insertIntoManagedObjectContext: managedObjectContext)
        imitation21.setValue(21, forKey: "id")
        imitation21.setValue("Então é Natal (Simone)", forKey: "imitation")
        imitation21.setValue("Música", forKey: "topic")
        
        let eImitation22 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation22 = NSManagedObject(entity: eImitation22!, insertIntoManagedObjectContext: managedObjectContext)
        imitation22.setValue(22, forKey: "id")
        imitation22.setValue("Robocopy Gay (Mamonas Assassinas)", forKey: "imitation")
        imitation22.setValue("Música", forKey: "topic")
        
        let eImitation23 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation23 = NSManagedObject(entity: eImitation23!, insertIntoManagedObjectContext: managedObjectContext)
        imitation23.setValue(23, forKey: "id")
        imitation23.setValue("Show das Poderosas (Anitta)", forKey: "imitation")
        imitation23.setValue("Música", forKey: "topic")
        
        let eImitation24 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation24 = NSManagedObject(entity: eImitation24!, insertIntoManagedObjectContext: managedObjectContext)
        imitation24.setValue(24, forKey: "id")
        imitation24.setValue("Macarena", forKey: "imitation")
        imitation24.setValue("Música", forKey: "topic")
        
        let eImitation25 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation25 = NSManagedObject(entity: eImitation25!, insertIntoManagedObjectContext: managedObjectContext)
        imitation25.setValue(25, forKey: "id")
        imitation25.setValue("Porque Homem Não Chora (Pablo)", forKey: "imitation")
        imitation25.setValue("Música", forKey: "topic")
        
        let eImitation26 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation26 = NSManagedObject(entity: eImitation26!, insertIntoManagedObjectContext: managedObjectContext)
        imitation26.setValue(26, forKey: "id")
        imitation26.setValue("Harlem Shake", forKey: "imitation")
        imitation26.setValue("Virais", forKey: "topic")
        
        let eImitation27 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation27 = NSManagedObject(entity: eImitation27!, insertIntoManagedObjectContext: managedObjectContext)
        imitation27.setValue(27, forKey: "id")
        imitation27.setValue("Forninho caiu", forKey: "imitation")
        imitation27.setValue("Virais", forKey: "topic")
        
        let eImitation28 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation28 = NSManagedObject(entity: eImitation28!, insertIntoManagedObjectContext: managedObjectContext)
        imitation28.setValue(28, forKey: "id")
        imitation28.setValue("Psirico - Lepo Lepo", forKey: "imitation")
        imitation28.setValue("Virais", forKey: "topic")
        
        let eImitation29 = NSEntityDescription.entityForName(ENTITY_IMITATION_GAME, inManagedObjectContext: managedObjectContext)
        let imitation29 = NSManagedObject(entity: eImitation29!, insertIntoManagedObjectContext: managedObjectContext)
        imitation29.setValue(29, forKey: "id")
        imitation29.setValue("\"Sabe de nada, inocente\" (BomNegócio.com)", forKey: "imitation")
        imitation29.setValue("Virais", forKey: "topic")
        
        // JOKING GAME
        
        let eJoking01 = NSEntityDescription.entityForName(ENTITY_JOKING_GAME, inManagedObjectContext: managedObjectContext)
        let joking01 = NSManagedObject(entity: eJoking01!, insertIntoManagedObjectContext: managedObjectContext)
        joking01.setValue(1, forKey: "id")
        joking01.setValue("Imitar uma galinha de uma perna só chocando um ovo", forKey: "joking")
        
        let eJoking02 = NSEntityDescription.entityForName(ENTITY_JOKING_GAME, inManagedObjectContext: managedObjectContext)
        let joking02 = NSManagedObject(entity: eJoking02!, insertIntoManagedObjectContext: managedObjectContext)
        joking02.setValue(2, forKey: "id")
        joking02.setValue("Dançar É o Tchan", forKey: "joking")
        
        let eJoking03 = NSEntityDescription.entityForName(ENTITY_JOKING_GAME, inManagedObjectContext: managedObjectContext)
        let joking03 = NSManagedObject(entity: eJoking03!, insertIntoManagedObjectContext: managedObjectContext)
        joking03.setValue(3, forKey: "id")
        joking03.setValue("Imitar o Antonio celebrando uma missa", forKey: "joking")
        
        let eJoking04 = NSEntityDescription.entityForName(ENTITY_JOKING_GAME, inManagedObjectContext: managedObjectContext)
        let joking04 = NSManagedObject(entity: eJoking04!, insertIntoManagedObjectContext: managedObjectContext)
        joking04.setValue(4, forKey: "id")
        joking04.setValue("Imitar o Guto dançando a música Vermelho", forKey: "joking")
        
        let eJoking05 = NSEntityDescription.entityForName(ENTITY_JOKING_GAME, inManagedObjectContext: managedObjectContext)
        let joking05 = NSManagedObject(entity: eJoking05!, insertIntoManagedObjectContext: managedObjectContext)
        joking05.setValue(5, forKey: "id")
        joking05.setValue("Imitar o Max dançando eguinha pocotó", forKey: "joking")
        
        let eJoking06 = NSEntityDescription.entityForName(ENTITY_JOKING_GAME, inManagedObjectContext: managedObjectContext)
        let joking06 = NSManagedObject(entity: eJoking06!, insertIntoManagedObjectContext: managedObjectContext)
        joking06.setValue(6, forKey: "id")
        joking06.setValue("Dançar Billie Jean Michael Jackson", forKey: "joking")
        
        let eJoking07 = NSEntityDescription.entityForName(ENTITY_JOKING_GAME, inManagedObjectContext: managedObjectContext)
        let joking07 = NSManagedObject(entity: eJoking07!, insertIntoManagedObjectContext: managedObjectContext)
        joking07.setValue(7, forKey: "id")
        joking07.setValue("Declamar soneto da fidelidade em ritmo de funk", forKey: "joking")
        
        let eJoking08 = NSEntityDescription.entityForName(ENTITY_JOKING_GAME, inManagedObjectContext: managedObjectContext)
        let joking08 = NSManagedObject(entity: eJoking08!, insertIntoManagedObjectContext: managedObjectContext)
        joking08.setValue(8, forKey: "id")
        joking08.setValue("Dançar Florentina (Tiririca)", forKey: "joking")
        
        let eJoking09 = NSEntityDescription.entityForName(ENTITY_JOKING_GAME, inManagedObjectContext: managedObjectContext)
        let joking09 = NSManagedObject(entity: eJoking09!, insertIntoManagedObjectContext: managedObjectContext)
        joking09.setValue(9, forKey: "id")
        joking09.setValue("Chame um amigo para ser sua Joelma e Você será o Chimbinha", forKey: "joking")
        
        let eJoking10 = NSEntityDescription.entityForName(ENTITY_JOKING_GAME, inManagedObjectContext: managedObjectContext)
        let joking10 = NSManagedObject(entity: eJoking10!, insertIntoManagedObjectContext: managedObjectContext)
        joking10.setValue(10, forKey: "id")
        joking10.setValue("Dançar YMCA", forKey: "joking")
        
//        let eJoking11 = NSEntityDescription.entityForName(ENTITY_JOKING_GAME, inManagedObjectContext: managedObjectContext)
//        let joking11 = NSManagedObject(entity: eJoking11!, insertIntoManagedObjectContext: managedObjectContext)
//        joking11.setValue(11, forKey: "id")
//        joking11.setValue("", forKey: "joking")

        do {
            try
                managedObjectContext.save()
            print("delegate save initializeBD")
            
        }catch {
            print("delegate exception save error")
        }
    }
}
