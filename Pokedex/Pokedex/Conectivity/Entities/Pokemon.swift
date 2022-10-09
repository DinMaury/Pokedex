import Foundation

struct PokemonFetched: Decodable {
    
    let results: [Pokemon]
}

struct Pokemon: Decodable {
    
    let name: String
    let url: String
}

struct PokemonView: Decodable {
    let pokemon: Pokemon
    let imageURL: String
}
