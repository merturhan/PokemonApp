//
//  MainPokemonModel.swift
//  PokemonApp
//
//  Created by Mert Urhan on 27.03.2023.
//

import Foundation

struct MainPokemonModel : Codable{
    var results : [Results]?
}

struct Results : Codable, Identifiable{
    var id : UUID?
    var name : String?
    var url : String?
    
    init(){
        
    }
    
    init(name: String, url: String) {
        self.id = UUID()
        self.name = name
        self.url = url
    }
}
