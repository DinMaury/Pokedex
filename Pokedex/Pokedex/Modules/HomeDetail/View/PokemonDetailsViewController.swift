import UIKit

class PokemonDetailsViewController: UIViewController {

    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var namePokemonLabel: UILabel!{
        didSet {
            namePokemonLabel.font = UIFont(name: "Pokemon Solid", size: 25)
            namePokemonLabel.textAlignment = .center
            namePokemonLabel.textColor = .white
            namePokemonLabel.backgroundColor = .red
        }
    }
    @IBOutlet weak var abilityLabel: UILabel! {
        didSet {
            abilityLabel.text = "Abilities: "
            abilityLabel.textAlignment = .center
            abilityLabel.textColor = .red
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Properties
    private var presenter: HomeDetailPresenterProtocol
    
    //MARK: - Inits
    init(_ presenter: HomeDetailPresenterProtocol) {
        
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Cycle life
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.delegate = self
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        collectionView.register(.init(nibName: PokemonDetailsCell.identifier, bundle: nil), forCellWithReuseIdentifier: PokemonDetailsCell.identifier)

        collectionView.dataSource = presenter.dataSource
        collectionView.delegate = presenter.dataSource
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }

}

private extension PokemonDetailsViewController {
    
}

//MARK: - HomeDetailDelegate
extension PokemonDetailsViewController: HomeDetailDelegate {
    
    func showDetails(pokemon: PokemonDetail) {
        DispatchQueue.main.async {
            self.pokemonImageView.downloadImage(id: "\(pokemon.id)")
            self.descriptionLabel.downloadDescription(id: "\(pokemon.id)")
            self.namePokemonLabel.text = pokemon.name.capitalized
            self.collectionView.reloadData()
        }
    }
}
