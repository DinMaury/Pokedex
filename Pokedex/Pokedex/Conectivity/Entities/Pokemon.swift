import Foundation

struct PokemonFetched: Decodable {
    
    let results: [Pokemon]
}

struct Pokemon: Decodable {
    
    let name: String
    let url: String
}

struct PokemonDetail: Decodable {
    
    let id: Int
    let name: String
    let abilities: [PokemonAbility]
}

struct PokemonDescription: Decodable {
    
    let flavor_text_entries: [Flavor]
}
