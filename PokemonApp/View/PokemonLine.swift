//
//  PokemonLine.swift
//  PokemonApp
//
//  Created by Mert Urhan on 27.03.2023.
//

import SwiftUI

struct PokemonLine: View {
    
    @State private var name : String = ""
    @State var pokemon : MainPokemonModel
    
    var body: some View {
        
        HStack{
            AsyncImage(url: URL(string: pokemon.sprites.front_default)) { image in
                image
                    .resizable()
                    .frame(width: 150, height: 150)
                    .padding(.horizontal)
            } placeholder: {
                ProgressView()
            }
                
        
            Spacer()
            Text(name)
                .font(.custom("Avenir", size: 30))
                .padding(.horizontal)
        }
        .frame(width: UIScreen.main.bounds.width, height: 150)
        .onAppear{
            name = pokemon.name
        }
        
    }
}

//struct PokemonLine_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonLine()
//    }
//}
