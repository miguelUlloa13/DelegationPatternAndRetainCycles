//
//  ProtocolAPIClientDelegate.swift
//  Delegation Pattern and Retain Cycles
//
//  Created by Miguel Angel Bric Ulloa on 29/04/23.
//

import Foundation

protocol APIClientDelegateProtocol: AnyObject {
    func updatePokemon(pokemons: PokemonResponseDataModel)
}
