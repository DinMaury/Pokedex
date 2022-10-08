import Foundation
import UIKit

final class HomeDataSource: NSObject {
    
    var pokemonTappedCompletion: ((PokemonModel) -> Void)?
    var reloadColletionView: ((Int) -> Void)?
    
    private var pokemones: [PokemonModel] = []
    
    func appendPokemones(_ newPokemones: [PokemonModel]) {
        pokemones.append(contentsOf: newPokemones)
    }
    func reloadPokemones(_ newPokemones: [PokemonModel]) {
        pokemones = newPokemones
    }
}

// MARK: - UICollectionViewDataSource
extension HomeDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pokemones.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCell.identifier, for: indexPath)
        let pokemon = pokemones[indexPath.row]
        
        if let cell = cell as? PokemonCell {
            cell.configure(pokemon)
        }
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension HomeDataSource: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.bounds.width/2, height: collectionView.bounds.width/2)
    }
    
}
// MARK: - UICollectionViewDelegate
extension HomeDataSource: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let pokemon = pokemones[indexPath.row]
        pokemonTappedCompletion?(pokemon)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if indexPath.item + 1 == pokemones.count{
            let offset = pokemones.count
            
            reloadColletionView?(offset)
        }
        
        if indexPath.item == 0, pokemones.count > 30 { 
            
            let offset = 0
            reloadColletionView?(offset)
        }
    }
}
