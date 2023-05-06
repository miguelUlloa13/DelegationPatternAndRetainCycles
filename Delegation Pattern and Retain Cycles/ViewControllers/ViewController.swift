//
//  ViewController.swift
//  Delegation Pattern and Retain Cycles
//
//  Created by Miguel Angel Bric Ulloa on 29/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var PokemonName: UILabel!
    @IBOutlet weak var getAPIButton: UIButton!
    @IBOutlet weak var PresentViewController2: UIButton!
    
    let apiClient = APIClient()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAPIButton.titleLabel?.text = "Obtener PokeAPI"
        apiClient.delegate = self
    }
    
    @IBAction func getAPIButtonAction(_ sender: UIButton) {
        apiClient.getPokemons()
    }
    
    @IBAction func PresentViewControllerAction(_ sender: UIButton) {
        navigationController?.present(ViewController2(), animated: true)
    }
    

}

extension ViewController: APIClientDelegateProtocol {
    func updatePokemon(pokemons: PokemonResponseDataModel) {
        DispatchQueue.main.async {
            self.PokemonName.text = pokemons.pokemons.randomElement()?.name
        }
    }
    
    
}

