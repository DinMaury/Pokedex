import UIKit

class PokemonCell: UICollectionViewCell {

    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel! {
        didSet {
            pokemonNameLabel.font = UIFont(name: "Pokemon Solid", size: 20)
            pokemonNameLabel.textAlignment = .center
            pokemonNameLabel.textColor = .white
            pokemonNameLabel.backgroundColor = .red
        }
    }
    
    func configure(_ pokemon: PokemonModel) {
        
        pokemonNameLabel.text = pokemon.name.capitalized
        pokemonImageView.downloadImage(id: pokemon.id)
    }
}
