import UIKit

class PokemonDetailsCell: UICollectionViewCell {

    @IBOutlet weak var detailsPokemonLabel: UILabel!
    
    func configure(_ details: String) {
        
        self.detailsPokemonLabel.text = details
    }
}
