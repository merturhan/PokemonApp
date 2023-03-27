//
//  PokemonGrid.swift
//  PokemonApp
//
//  Created by Mert Urhan on 27.03.2023.
//

import SwiftUI

struct PokemonGrid: View {
    
    @State private var name : String = ""
    @State var pokemon : MainPokemonModel
    
    var body: some View {
            ZStack{
                Color.secondary
                    .opacity(0.1)
                    .cornerRadius(8)
                    .shadow(color: .blue, radius: 2)
                
                VStack{
                    AsyncImage(url: URL(string: pokemon.sprites.front_default)) { image in
                        image
                            .resizable()
                            .frame(width: 150, height: 150)
                            .cornerRadius(8)
                    } placeholder: {
                        ProgressView()
                    }
                        
                    
                    Text(pokemon.name)
                        .font(.custom("Avenit", size: 24))
                        .bold()
                }
                
            }.frame(width: 175, height: 225)
            
            
            
            

        
    }
}
//
//struct PokemonGrid_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonGrid()
//    }
//}
