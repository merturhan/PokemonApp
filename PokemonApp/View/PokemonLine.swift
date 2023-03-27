//
//  PokemonLine.swift
//  PokemonApp
//
//  Created by Mert Urhan on 27.03.2023.
//

import SwiftUI

struct PokemonLine: View {
    
    @State private var name : String = ""
    @State var pokemon : Results
    
    var body: some View {
        
        HStack{
            Rectangle()
                .frame(width: 125, height: 125, alignment: .center)
                .padding(.horizontal)
        
            Spacer()
            Text(name)
                .font(.custom("Avenir", size: 30))
                .padding(.horizontal)
        }
        .frame(width: UIScreen.main.bounds.width)
        .border(.red)
        .onAppear{
            name = pokemon.name!
        }
        
    }
}

//struct PokemonLine_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonLine()
//    }
//}
