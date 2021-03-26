//
//  File.swift
//  
//
//  Created by PJ Gray on 3/25/21.
//

import Foundation

class PlayerCharacter {
    var level: Int?
    
    init() {}
    
    init(level: Int) {
        self.level = level
    }
    
    func xpThreshhold(withEncounterDifficulty difficulty:Difficulty) -> Int {
        switch difficulty {
        case .easy:
            switch self.level ?? 1 {
            case 1: return 25
            case 2: return 50
            case 3: return 75
            case 4: return 125
            case 5: return 250
            case 6: return 300
            case 7: return 350
            case 8: return 450
            case 9: return 550
            case 10: return 600
            case 11: return 800
            case 12: return 1000
            case 13: return 1100
            case 14: return 1250
            case 15: return 1400
            case 16: return 1600
            case 17: return 2000
            case 18: return 2100
            case 19: return 2400
            case 20: return 2800
            default: return -1
            }
        case .medium:
            switch self.level ?? 1 {
            case 1: return 50
            case 2: return 100
            case 3: return 150
            case 4: return 250
            case 5: return 500
            case 6: return 600
            case 7: return 750
            case 8: return 900
            case 9: return 1100
            case 10: return 1200
            case 11: return 1600
            case 12: return 2000
            case 13: return 2200
            case 14: return 2500
            case 15: return 2800
            case 16: return 3200
            case 17: return 3900
            case 18: return 4200
            case 19: return 4900
            case 20: return 5700
            default: return -1
            }
        case .hard:
            switch self.level ?? 1 {
            case 1: return 75
            case 2: return 150
            case 3: return 225
            case 4: return 375
            case 5: return 750
            case 6: return 900
            case 7: return 1100
            case 8: return 1400
            case 9: return 1600
            case 10: return 1900
            case 11: return 2400
            case 12: return 3000
            case 13: return 3400
            case 14: return 3800
            case 15: return 4300
            case 16: return 4800
            case 17: return 5900
            case 18: return 6300
            case 19: return 7300
            case 20: return 8500
            default: return -1
            }
        case .deadly:
            switch self.level ?? 1 {
            case 1: return 100
            case 2: return 200
            case 3: return 400
            case 4: return 500
            case 5: return 1100
            case 6: return 1400
            case 7: return 1700
            case 8: return 2100
            case 9: return 2400
            case 10: return 2800
            case 11: return 3600
            case 12: return 4500
            case 13: return 5100
            case 14: return 5700
            case 15: return 6400
            case 16: return 7200
            case 17: return 8800
            case 18: return 9500
            case 19: return 10900
            case 20: return 12700
            default: return -1
            }
        }
    }

    func adjustedXPPerAdventuringDay() -> Int {
        switch self.level ?? 1 {
        case 1: return 300
        case 2: return 600
        case 3: return 1200
        case 4: return 1700
        case 5: return 3500
        case 6: return 4000
        case 7: return 5000
        case 8: return 6000
        case 9: return 7500
        case 10: return 9000
        case 11: return 10500
        case 12: return 11500
        case 13: return 13500
        case 14: return 15000
        case 15: return 18000
        case 16: return 20000
        case 17: return 25000
        case 18: return 27000
        case 19: return 30000
        case 20: return 40000
        default:
            return 0
        }
    }

}
