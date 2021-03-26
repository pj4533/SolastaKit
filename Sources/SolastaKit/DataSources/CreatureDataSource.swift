//
//  File.swift
//  
//
//  Created by PJ Gray on 3/25/21.
//

import Foundation

public class CreatureDataSource {
    var creatures : [Creature] = []

    init() {
        if let url = Bundle.module.url(forResource: "creatures", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                self.creatures = try decoder.decode([Creature].self, from: data)
            } catch {
                print("Error parsing creatures")
            }
        }
    }
    
    func getMediumCreature(withExperience experience:Int) -> Creature? {
        var creatures : [Creature] = []
        
        var delta = 0
        repeat {
            delta = delta + 10
            creatures = self.creatures.filter({
                ($0.experiencePoints() > (experience-delta)) && ($0.experiencePoints() < experience) && ($0.challengeRating != "0")
            })
            if (experience-delta < 0) { break }
        } while creatures.count == 0
        
        return creatures.randomElement()
    }

    func getMediumCreature(withMinExperience minExperience:Int, maxExperience:Int) -> Creature? {
        return self.creatures.filter({
            ($0.experiencePoints() > minExperience) && ($0.experiencePoints() < maxExperience) && ($0.challengeRating != "0") && ($0.size == "medium")
        }).randomElement()
    }

}
