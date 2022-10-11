import Foundation
import UIKit

//MARK: - Class Ability
final class HomeDetailDataSource: NSObject {
    
    var reloadColletionView: ((Int) -> Void)?
    
    private var abilities: [String] = []
    
    func appendPokemones(_ newDetails: PokemonDetail) {
    
        var abilities: [String] = []
        
        for i in 0 ..< newDetails.abilities.count {
            
            abilities.append(newDetails.abilities[i].ability.name)
        }
        self.abilities = abilities
    }
}
// MARK: - UICollectionViewDataSource
extension HomeDetailDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        abilities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonDetailsCell.identifier, for: indexPath)
        let detail = abilities[indexPath.row]
        
        if let cell = cell as? PokemonDetailsCell {
            cell.configure(detail)
        }
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension HomeDetailDataSource: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.bounds.width/2, height: collectionView.bounds.width)
    }
}

extension HomeDetailDataSource: UICollectionViewDelegate {
    
}

