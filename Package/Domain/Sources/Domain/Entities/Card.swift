//
//  Card.swift
//
//
//  Created by Leonardo Mendez on 9/04/24.
//

import Foundation

public struct CardData: Codable {
    public let cards: [Card]
}

// MARK: - Card
public struct Card: Codable {
    public let name, manaCost: String
    public let cmc: Int
    public let colors, colorIdentity: [Color]
    public let type: String
    public let types: [TypeElement]
    public let subtypes: [String]?
    public let rarity: Rarity
    public let cardSet: Set
    public let setName: SetName
    public let text, artist, number: String
    public let power, toughness: String?
    public let layout: Layout
    public let multiverseid: String?
    public let imageURL: String?
    public let variations: [String]?
    public let foreignNames: [ForeignName]?
    public let printings: [String]
    public let originalText, originalType: String?
    public let legalities: [LegalityElement]
    public let id: String
    public let flavor: String?
    public let rulings: [Ruling]?
    public let supertypes: [String]?

    enum CodingKeys: String, CodingKey {
        case name, manaCost, cmc, colors, colorIdentity, type, types, subtypes, rarity
        case cardSet = "set"
        case setName, text, artist, number, power, toughness, layout, multiverseid
        case imageURL = "imageUrl"
        case variations, foreignNames, printings, originalText, originalType, legalities, id, flavor, rulings, supertypes
    }
}

public enum Set: String, Codable {
    case the10E = "10E"
}

public enum Color: String, Codable {
    case u = "U"
    case w = "W"
}

// MARK: - ForeignName
public struct ForeignName: Codable {
    public let name, text, type: String
    public let flavor: String?
    public let imageURL: String
    public let language: Language
    public let multiverseid: Int

    enum CodingKeys: String, CodingKey {
        case name, text, type, flavor
        case imageURL = "imageUrl"
        case language, multiverseid
    }
}

public enum Language: String, Codable {
    case chineseSimplified = "Chinese Simplified"
    case french = "French"
    case german = "German"
    case italian = "Italian"
    case japanese = "Japanese"
    case portugueseBrazil = "Portuguese (Brazil)"
    case russian = "Russian"
    case spanish = "Spanish"
}

public enum Layout: String, Codable {
    case normal = "normal"
}

// MARK: - LegalityElement
public struct LegalityElement: Codable {
    public let format: Format
    public let legality: LegalityEnum
}

public enum Format: String, Codable {
    case alchemy = "Alchemy"
    case commander = "Commander"
    case duel = "Duel"
    case explorer = "Explorer"
    case gladiator = "Gladiator"
    case historic = "Historic"
    case historicbrawl = "Historicbrawl"
    case legacy = "Legacy"
    case modern = "Modern"
    case oathbreaker = "Oathbreaker"
    case pauper = "Pauper"
    case paupercommander = "Paupercommander"
    case penny = "Penny"
    case pioneer = "Pioneer"
    case predh = "Predh"
    case premodern = "Premodern"
    case vintage = "Vintage"
}

public enum LegalityEnum: String, Codable {
    case legal = "Legal"
    case restricted = "Restricted"
}

public enum Rarity: String, Codable {
    case common = "Common"
    case rare = "Rare"
    case uncommon = "Uncommon"
}

// MARK: - Ruling
public struct Ruling: Codable {
    public let date, text: String
}

public enum SetName: String, Codable {
    case tenthEdition = "Tenth Edition"
}

public enum TypeElement: String, Codable {
    case creature = "Creature"
    case enchantment = "Enchantment"
    case instant = "Instant"
    case sorcery = "Sorcery"
}
