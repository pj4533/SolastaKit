//
//  File.swift
//  
//
//  Created by PJ Gray on 3/25/21.
//

import Foundation

class Encounter {
    class func adjustedXPMultiplier(forPartySize partySize:Int, numEnemies:Int) -> Double {
        if partySize < 3 {
            switch numEnemies {
            case 1: return 1.5
            case 2: return 2.0
            case 3...6: return 2.5
            case 7...10: return 3.0
            case 11...14: return 4.0
            default: return 5.0
            }
        } else if partySize < 6 {
            switch numEnemies {
            case 1: return 1.0
            case 2: return 1.5
            case 3...6: return 2.0
            case 7...10: return 2.5
            case 11...14: return 3.0
            default: return 4.0
            }
        } else {
            switch numEnemies {
            case 1: return 0.5
            case 2: return 1.0
            case 3...6: return 1.5
            case 7...10: return 2.0
            case 11...14: return 2.5
            default: return 3.0
            }
        }
    }
}
