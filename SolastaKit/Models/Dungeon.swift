//
//  Dungeon.swift
//  SolastaKit
//
//  Created by PJ Gray on 3/25/2021.
//

import Foundation

public struct Dungeon: Codable {
    var dungeonMakerVersion: Double?
    public var title: String?
    public var description: String?
    public var author: String?
    public var startLevelMin: Int?
    public var startLevelMax: Int?
}
