//
//  APIClient.swift
//  Delegation Pattern and Retain Cycles
//
//  Created by Miguel Angel Bric Ulloa on 29/04/23.
//

import Foundation

class APIClient {
    
    weak var delegate: APIClientDelegateProtocol?
    
    func getPokemons() {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=60&offset=151")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            let dataModel = try! JSONDecoder().decode(PokemonResponseDataModel.self, from: data!)
            print("Data Model: \(dataModel)")
            self.delegate?.updatePokemon(pokemons: dataModel)
        }
        task.resume()
    }
}
