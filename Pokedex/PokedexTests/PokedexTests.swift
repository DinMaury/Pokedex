import XCTest
@testable import Pokedex

class PokedexTests: XCTestCase {

    func testDownloadPokemones() {
        let downloadPokemones = PokemonManager()
        downloadPokemones.fetchPokemon(offset: 0) { pokemones in
            XCTAssertTrue(pokemones.count == 30)
        }
        downloadPokemones.fetchPokemon(pokemonId: "135") { pokemonDetail in
            XCTAssertTrue(pokemonDetail.id == 135)
        }
    }
    
}
