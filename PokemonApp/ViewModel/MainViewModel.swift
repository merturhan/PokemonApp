//
//  MainViewModel.swift
//  PokemonApp
//
//  Created by Mert Urhan on 27.03.2023.
//

import Foundation


class MainViewModel : ObservableObject{
    
    @Published var pokemons : [Results] = []
    
    public func loader() async throws {
        
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=30") else{
            fatalError("Wrong URL")
        }
        let urlRequest = URLRequest(url: url)
        let (data,response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else{
            fatalError("Error, data couldn't fetched")
        }
        
        let decodedData = try JSONDecoder().decode(MainPokemonModel.self, from: data)
        DispatchQueue.main.async {
            decodedData.results!.forEach { d in
                self.pokemons.append(Results(name: d.name!, url: d.url!))
            }
        }
    }
    
    public func displayData(){
        self.pokemons.forEach { p in
            print(p.id!)
        }
    }
    
}
