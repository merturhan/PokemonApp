//
//  ContentView.swift
//  PokemonApp
//
//  Created by Mert Urhan on 27.03.2023.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel = MainViewModel()
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        
        NavigationStack{
            
            ScrollView{
                
                LazyVGrid(columns: columns){
                    ForEach(viewModel.pokemons){ data in
                        NavigationLink(destination: {
                            Text(data.name)
                        }) {
                            PokemonGrid(pokemon: data)
                        }.buttonStyle(PlainButtonStyle())
                    }
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
