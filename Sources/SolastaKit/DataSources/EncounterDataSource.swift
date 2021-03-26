import Foundation

public class EncounterDataSource: NSObject {

    public func getRandomEncounter() -> Gadget? {
        if let url = Bundle.module.url(forResource: "creatures", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let mediumCreatures = try decoder.decode([Creature].self, from: data).filter({$0.size == "medium"})
                let totalRandomCreatureLabel = mediumCreatures.randomElement()?.label ?? ""
                let gadget = Gadget(uniqueName: "Monster\(UUID().uuidString)", localPosition: nil, orientation: 1, gadgetBlueprintName: "MonsterM", parameterValues: [
                    ParameterValue(gadgetParameterDescriptionName: "Creature", intValue: 0, stringValue: totalRandomCreatureLabel, boolValue: false, stringsList: []),
                    ParameterValue(gadgetParameterDescriptionName: "EncounterGroup", intValue: 0, stringValue: "", boolValue: false, stringsList: []),
                    ParameterValue(gadgetParameterDescriptionName: "GroupIndex", intValue: 1, stringValue: "", boolValue: false, stringsList: [])
                ])
                return gadget
            } catch {
                print("Error parsing creatures")
            }
        }
        
        return nil
    }
}
