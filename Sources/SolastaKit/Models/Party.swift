//
//  File.swift
//  
//
//  Created by PJ Gray on 3/25/21.
//

import Foundation

import Foundation

class Party {
    var members : [PlayerCharacter]
    var elitePartyFactor : Double?
    
    init() {
        self.members = []
    }
    
    init(members: [PlayerCharacter]) {
        self.members = members
    }
    
    func xpThreshhold(withEncounterDifficulty difficulty:Difficulty) -> Int {
        return Int(Double(self.members.map({$0.xpThreshhold(withEncounterDifficulty: difficulty)}).reduce(0, +)) * (self.elitePartyFactor ?? 1.0))
    }

    func adjustedXPPerAdventuringDay() -> Int {
        return Int(Double(self.members.map({$0.adjustedXPPerAdventuringDay()}).reduce(0,+)) * (self.elitePartyFactor ?? 1.0))
    }
}
