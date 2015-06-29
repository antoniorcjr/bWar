//
//  BWTeam+CoreDataProperties.swift
//  bWar
//
//  Created by Adriana Izel on 6/29/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//
//  Delete this file and regenerate it using "Create NSManagedObject Subclass…"
//  to keep your implementation up to date with your model.
//

import Foundation
import CoreData

extension BWTeam {

    @NSManaged var id: NSNumber?
    @NSManaged var isMorning: NSNumber?
    @NSManaged var name: String?
    @NSManaged var score: NSNumber?

}
