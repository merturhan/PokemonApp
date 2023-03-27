//
//  AbilityModel.swift
//  PokemonApp
//
//  Created by Mert Urhan on 27.03.2023.
//

import Foundation


struct AbilityModel: Codable {
    let effectChanges: [EffectChange]
    let effectEntries: [WelcomeEffectEntry]
    let flavorTextEntries: [FlavorTextEntry]
    let generation: Generation
    let id: Int
    let isMainSeries: Bool
    let name: String
    let names: [Name]
    let pokemon: [Pokemon]

    enum CodingKeys: String, CodingKey {
        case effectChanges = "effect_changes"
        case effectEntries = "effect_entries"
        case flavorTextEntries = "flavor_text_entries"
        case generation, id
        case isMainSeries = "is_main_series"
        case name, names, pokemon
    }
}


struct EffectChange: Codable {
    let effectEntries: [EffectChangeEffectEntry]
    let versionGroup: Generation

    enum CodingKeys: String, CodingKey {
        case effectEntries = "effect_entries"
        case versionGroup = "version_group"
    }
}


struct EffectChangeEffectEntry: Codable {
    let effect: String
    let language: Generation
}


struct Generation: Codable {
    let name: String
    let url: String
}

// MARK: - WelcomeEffectEntry
struct WelcomeEffectEntry: Codable {
    let effect: String
    let language: Generation
    let shortEffect: String

    enum CodingKeys: String, CodingKey {
        case effect, language
        case shortEffect = "short_effect"
    }
}


struct FlavorTextEntry: Codable {
    let flavorText: String
    let language, versionGroup: Generation

    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language
        case versionGroup = "version_group"
    }
}


struct Name: Codable {
    let language: Generation
    let name: String
}


struct Pokemon: Codable {
    let isHidden: Bool
    let pokemon: Generation
    let slot: Int

    enum CodingKeys: String, CodingKey {
        case isHidden = "is_hidden"
        case pokemon, slot
    }
}
