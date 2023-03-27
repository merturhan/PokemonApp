//
//  DetailsViewModel.swift
//  PokemonApp
//
//  Created by Mert Urhan on 27.03.2023.
//

import Foundation

class DetailsViewModel : ObservableObject{
    
    @Published var abilities : [AbilityModel] = []
    
    public func getAllPokemons(pokemon : MainPokemonModel) async throws {
        
        for i in 0...pokemon.abilities.count-1{
            guard let url = URL(string: pokemon.abilities[i].ability.url) else{
                fatalError("Wrong URL")
            }
            let urlRequest = URLRequest(url: url)
            let (data,response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else{
                fatalError("Error, data couldn't fetched")
            }
            
            let pokemonData = try JSONDecoder().decode(AbilityModel.self, from: data)
            abilities.append(pokemonData)
            //print(pokemonData.name)
        }
        
        
    }
}
