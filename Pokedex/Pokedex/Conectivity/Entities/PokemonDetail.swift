import Foundation

struct PokemonAbility: Decodable {
    
    let ability: Pokemon
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

struct Flavor: Decodable {
    let flavor_text: String
}
