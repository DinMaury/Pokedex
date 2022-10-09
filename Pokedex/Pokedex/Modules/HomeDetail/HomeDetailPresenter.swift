import UIKit

// MARK: - Protocol
protocol HomeDetailPresenterProtocol {
    
    
    var dataSource: HomeDetailDataSource { get }
    var delegate: HomeDetailDelegate? { get set }
    
    func setupDelegate(delegate: HomeDetailDelegate)
    
    func show(in navigationController: UINavigationController)
    func fetchPokemon()
}

//MARK: - Delegates
protocol HomeDetailDelegate: AnyObject {
    
    func showDetails(pokemon: PokemonDetail)
}

// MARK: - Presenter
final class HomeDetailPresenter {
    
    // MARK: - Properties
    private let router: HomeDetailRouterProtocol
    private let interactor: HomeDetailInteractorProtocol
    
    var dataSource = HomeDetailDataSource()
    
    weak var delegate: HomeDetailDelegate?
    
    //MARK: - Inits
    init(router: HomeDetailRouterProtocol, interactor: HomeDetailInteractorProtocol) {
        
        self.router = router
        self.interactor = interactor
        self.fetchPokemon()
    }
}

//MARK: - HomeDetailPresenterProtocol

extension HomeDetailPresenter: HomeDetailPresenterProtocol {
    
    func setupDelegate(delegate: HomeDetailDelegate) {
        self.delegate = delegate
    }
    
    func show(in navigationController: UINavigationController) {
        router.show(presenter: self, in: navigationController)
        
    }
    
    func fetchPokemon() {
        interactor.fetchPokemon() { fetched in
            
            self.dataSource.appendPokemones(fetched)
            self.delegate?.showDetails(pokemon: fetched)
            
        }
    }
}
