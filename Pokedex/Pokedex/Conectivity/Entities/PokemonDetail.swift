import Foundation

struct PokemonAbility: Decodable {
    
    let ability: Pokemon
}

struct PokemonDetail: Decodable {
    
    let id: Int
    let name: String
    let abilities: [PokemonAbility]
    let forms: [PokemonForm]
}

struct PokemonDetailFetched {
    
    let name: String
    let abilities: [String]
    
    init(detail: PokemonDetail) {
        
        self.name = detail.name
        var ability = [String]()
        for i in 0 ..< detail.abilities.count {
            
            ability.append(detail.abilities[i].ability.name)
        }
        self.abilities = ability
    }
}

struct PokemonForm: Decodable {
    let form: Pokemon
}

struct PokemonForms: Decodable {

    let sprites: Sprite
}


struct Sprite: Decodable {
    let front_default: String
}
