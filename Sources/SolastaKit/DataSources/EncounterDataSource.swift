import Foundation

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
}
