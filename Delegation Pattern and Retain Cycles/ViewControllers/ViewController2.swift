//
//  ViewController.swift
//  Delegation Pattern and Retain Cycles
//
//  Created by Miguel Angel Bric Ulloa on 29/04/23.
//

import UIKit

class ViewController2: UIViewController {
    
    deinit {
        print("Deinit Viewcontroller2")
    }
    
    @IBOutlet weak var PokemonName: UILabel!
    @IBOutlet weak var getAPIButton: UIButton!
    
    let apiClient = APIClient()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .orange
        getAPIButton.titleLabel?.text = "Obtener PokeAPI"
        apiClient.delegate = self
    }
    
    @IBAction func getAPIButtonAction(_ sender: UIButton) {
        apiClient.getPokemons()
    }
    


}

extension ViewController2: APIClientDelegateProtocol {
    func updatePokemon(pokemons: PokemonResponseDataModel) {
        DispatchQueue.main.async {
            self.PokemonName.text = pokemons.pokemons.randomElement()?.name
        }
    }
    
    
}


