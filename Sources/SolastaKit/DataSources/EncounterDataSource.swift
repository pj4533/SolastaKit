import Foundation

public enum Difficulty : String, Codable, CaseIterable {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
    case deadly = "Deadly"
}

public class EncounterDataSource: NSObject {

    public func getRandomCreatureLabel() -> String? {
        if let url = Bundle.module.url(forResource: "creatures", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let mediumCreatures = try decoder.decode([Creature].self, from: data).filter({$0.size == "medium"})
                let totalRandomCreatureLabel = mediumCreatures.randomElement()?.label ?? ""
                return totalRandomCreatureLabel
            } catch {
                print("Error parsing creatures")
            }
        }
        
        return nil
    }
    
    public func getEncounter(withNumberCreatures numberOfCreatures: Int, forAverageLvl averageLevel: Int, withDifficulty difficulty: Difficulty) -> [String] {
        
        var enemyLabels: [String] = []
        
        let party = Party(members: [
            PlayerCharacter(level: averageLevel),
            PlayerCharacter(level: averageLevel),
            PlayerCharacter(level: averageLevel),
            PlayerCharacter(level: averageLevel)
        ])
        
        // encounter difficulties are a range, so a medium encounter is any between the threshold for medium and the threshhold for hard
        // this accounts for that range
        //
        var encounterXPBudget = 0
        switch difficulty {
        case .easy: encounterXPBudget = party.xpThreshhold(withEncounterDifficulty: .medium)
        case .medium: encounterXPBudget = party.xpThreshhold(withEncounterDifficulty: .hard)
        case .hard: encounterXPBudget = party.xpThreshhold(withEncounterDifficulty: .deadly)
        case .deadly: encounterXPBudget = party.xpThreshhold(withEncounterDifficulty: .deadly) + party.xpThreshhold(withEncounterDifficulty: .deadly)
        }

        var adjustedXPBudget = Int(Double(encounterXPBudget) / Encounter.adjustedXPMultiplier(forPartySize: party.members.count, numEnemies: numberOfCreatures))
        
//        print("Finding \(numberOfCreatures) - Adjusted Budget: \(adjustedXPBudget)")
        let datasource = CreatureDataSource()
        repeat {
            if enemyLabels.count == numberOfCreatures - 1 {
                if let creature = datasource.getMediumCreature(withExperience: adjustedXPBudget) {
//                    print("FOUND: \(creature.label ?? "")  CR: \(creature.challengeRating ?? "")  XP: \(creature.experiencePoints())")
                    adjustedXPBudget = adjustedXPBudget - creature.experiencePoints()
                    enemyLabels.append(creature.label ?? "")
                }
            } else {
                if let creature = datasource.getMediumCreature(withMinExperience: 10, maxExperience: adjustedXPBudget) {
//                    print("FOUND: \(creature.label ?? "")  CR: \(creature.challengeRating ?? "")  XP: \(creature.experiencePoints())")
                    adjustedXPBudget = adjustedXPBudget - creature.experiencePoints()
                    enemyLabels.append(creature.label ?? "")
                }
            }
        } while (adjustedXPBudget > 0) && (enemyLabels.count < numberOfCreatures)

        return enemyLabels
    }
}
