import Foundation

public class EncounterDataSource: NSObject {

    public func getRandomEncounter() {
        if let url = Bundle.module.url(forResource: "creatures", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let creatures = try decoder.decode([Creature].self, from: data)
                
                
            } catch {
                print("Error parsing creatures")
            }
        }
    }
}
