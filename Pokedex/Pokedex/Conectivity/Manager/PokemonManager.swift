import Foundation
import Alamofire

typealias PokemonFetchedCompletion = ([Pokemon]) -> Void
typealias PokemonDetailCompletion = (PokemonDetail) -> Void

//MARK: - Protocol
protocol PokemonManagerProtocol {
    
    func fetchPokemon(offset: Int?, completion: @escaping PokemonFetchedCompletion)
    func fetchPokemon(pokemonId: String, completion: @escaping PokemonDetailCompletion)
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
    
    func fetchPokemon(pokemonId: String, completion: @escaping PokemonDetailCompletion) {

        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(pokemonId)") else { return }
        AF.request(url) .responseDecodable(of: PokemonDetail.self) { [weak self] response in

            switch response.result {
            case .success(let data):
                completion(data)

            default:
                break
            }
        }
    }
}
