import Foundation
import Alamofire

typealias PokemonFetchedCompletion = ([Pokemon]) -> Void
typealias PokemonDetailFetchedCompletion = (PokemonDetailFetched) -> Void

//MARK: - Protocol
protocol PokemonManagerProtocol {
    
    func fetchPokemon(offset: Int?, completion: @escaping PokemonFetchedCompletion)
    func fetchPokemon(pokemonId: String, completion: @escaping PokemonDetailFetchedCompletion)
}

//MARK: - Manager
final class PokemonManager {
    
}

//MARK: - PokemonManagerProtocol
extension PokemonManager: PokemonManagerProtocol {
    
    func fetchPokemon(offset: Int?, completion: @escaping PokemonFetchedCompletion) {
        let offsets = offset ?? 0
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=30&offset=\(offsets)") else { return }
        AF.request(url) .responseDecodable(of: PokemonFetched.self) { [weak self] response in
            
            switch response.result {
            case .success(let data):
                completion(data.results)

            default:
                break
            }
        }
    }
    
    func fetchPokemon(pokemonId: String, completion: @escaping PokemonDetailFetchedCompletion) {
    }
}

//MARK: - Private PokemonManagerProtocol
private extension PokemonManager {
    func fetchPokemonView() {
        
    }
}
