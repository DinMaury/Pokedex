import Foundation
import UIKit

final class HomeDataSource: NSObject {
    
    private var pokemones: [PokemonModel] = []
    
    func appendPokemones(_ newPokemones: [PokemonModel]) {
        pokemones.append(contentsOf: newPokemones)
    }
    func reloadPokemones(_ newPokemones: [PokemonModel]) {
        pokemones = newPokemones
    }
}
