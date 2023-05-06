//
//  PokemonDataModel.swift
//  Delegation Pattern and Retain Cycles
//
//  Created by Miguel Angel Bric Ulloa on 29/04/23.
//

import Foundation

struct PokemonDataModel: Decodable {
    let name: String
    let url: String
}

struct PokemonResponseDataModel: Decodable {
    let pokemons: [PokemonDataModel]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pokemons = try container.decode([PokemonDataModel].self, forKey: .results)
    }
}
