//
//  MainViewModel.swift
//  PokemonApp
//
//  Created by Mert Urhan on 27.03.2023.
//

import Foundation


class MainViewModel : ObservableObject{
    
    @Published var pokemons : [MainPokemonModel] = []
    
    public func getAllPokemons() async throws {
        
        if(pokemons.count == 40){
            return
        }
        
        for i in 1...40{
            guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(i)") else{
                fatalError("Wrong URL")
            }
            let urlRequest = URLRequest(url: url)
            let (data,response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else{
                fatalError("Error, data couldn't fetched")
            }
            
            let pokemonData = try JSONDecoder().decode(MainPokemonModel.self, from: data)
            DispatchQueue.main.async {
                self.pokemons.append(pokemonData)
            }
        }
        
    }
}
