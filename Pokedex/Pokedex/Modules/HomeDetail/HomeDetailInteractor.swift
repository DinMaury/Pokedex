import Foundation

protocol HomeDetailInteractorProtocol {
    
    func fetchPokemon(completion: @escaping PokemonDetailCompletion)
}


final class HomeDetailInteractor {
    
    private let pokemonId: String
    private let pokemonManager: PokemonManagerProtocol
    
    init(pokemonId: String,pokemonManager: PokemonManagerProtocol = PokemonManager()) {
        
        self.pokemonId = pokemonId
        self.pokemonManager = pokemonManager
    }
}

// MARK: - HomeDetailInteractorProtocol
extension HomeDetailInteractor: HomeDetailInteractorProtocol {
    
    func fetchPokemon(completion: @escaping PokemonDetailCompletion){
        pokemonManager.fetchPokemon(pokemonId: pokemonId, completion: completion)
    }
}
