import Foundation

struct PokemonFetched: Decodable {
    
    let count: Int
    let next: String
    let previous: String?
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
