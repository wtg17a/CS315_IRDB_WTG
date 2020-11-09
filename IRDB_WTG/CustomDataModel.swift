//
//  CustomDataModel.swift
//  IRDB_WTG
//
//  Created by William Gibbs on 11/9/20.
//

import UIKit

class CustomDataModel: Codable {
    let categories: [BossCategory]
}

class BossCategory: Codable {
    let bossType: String
    let entries: [Boss]
}

class Boss: Codable {
    let name: String
    let chapter: Int
    let trackName: String
    let hp: Int
    let defense: Int
    let baseXP: Int
    let reward: String
    let hardModeReward: String?
    let tattleVi: String
    let tattleKabbu: String
    let tattleLeif: String
    let bestiary: String
    let DEEPESTLORE: String?
    let bossImageURL: String
    let resistances: [Resistance]
}

class Resistance: Codable {
    let resistanceName: String
    let resistanceValue: Int?
    let resistanceBool: Bool?
}
