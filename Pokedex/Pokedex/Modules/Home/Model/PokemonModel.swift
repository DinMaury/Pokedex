import Foundation

final class PokemonModel {
    
    let name: String
    let urlString: String
    let id: String
    
    init(_ pokemon: Pokemon) {
        
        var id = ""
        let chars = pokemon.url.split(separator: "/")
        if let last = chars.last {
            id = String(last)
        }
        
        self.id = id
        self.name = pokemon.name
        self.urlString = pokemon.url
    }
}
