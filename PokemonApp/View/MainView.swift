//
//  ContentView.swift
//  PokemonApp
//
//  Created by Mert Urhan on 27.03.2023.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel = MainViewModel()

    var body: some View {
        
        NavigationStack{
            
            ScrollView{
                ForEach(viewModel.pokemons){ data in
                    NavigationLink(destination: {
                        Text(data.name)
                    }) {
                        PokemonLine(pokemon: data)
                    }.buttonStyle(PlainButtonStyle())
                }
            }.id(UUID().uuidString)
            .navigationTitle("Pokemons")
        }
        .background(.secondary)
        .onAppear{
            Task{
                try await viewModel.getAllPokemons()
            }
        }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
