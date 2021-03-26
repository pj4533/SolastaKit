//
//  Roll.swift
//  
//
//  Created by PJ Gray on 3/25/21.
//

import Foundation

public struct Roll {

    public static func roll(_ rollString:String) -> Int? {
        let diceArray = rollString.split(separator: "d")
        if diceArray.count == 2 {
            let rolls = Int(diceArray[0]) ?? 0
            var returnValue = 0
            for _ in (0..<rolls) {
                switch diceArray[1] {
                case "2": returnValue = returnValue + Roll.d2()
                case "4": returnValue = returnValue + Roll.d4()
                case "6": returnValue = returnValue + Roll.d6()
                case "8": returnValue = returnValue + Roll.d8()
                case "10": returnValue = returnValue + Roll.d10()
                case "12": returnValue = returnValue + Roll.d12()
                case "20": returnValue = returnValue + Roll.d20()
                case "100": returnValue = returnValue + Roll.d100()
                default: continue
                }
            }
            return returnValue
        }
        return nil
    }
    
    public static func d(_ dice:Int) -> Int {
        return Int.random(in: 1...dice)
    }
    public static func d2() -> Int {
        return self.d(2)
    }
    public static func d4() -> Int {
        return self.d(4)
    }
    public static func d6() -> Int {
        return self.d(6)
    }
    public static func d8() -> Int {
        return self.d(8)
    }
    public static func d10() -> Int {
        return self.d(10)
    }
    public static func d12() -> Int {
        return self.d(12)
    }
    public static func d20() -> Int {
        return self.d(20)
    }
    public static func d100() -> Int {
        return self.d(100)
    }
}
