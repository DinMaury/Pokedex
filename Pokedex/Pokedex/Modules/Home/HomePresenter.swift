import Foundation

//MARK: - protocol
protocol HomePresenterProtocol {
    
    var dataSource: HomeDataSource { get }
    var delegate: HomePresenterDelegate? { get set }
    
    func show() -> HomeViewController
    func fetchPokemon(offset: Int?)
    func changeRows()
    func changeRowsFirts()
}

//MARK: - Delegate
protocol HomePresenterDelegate: AnyObject {
    func showLoading()
    func hideLoading()
    func reloadData()
}

//MARK: Presenter
final class HomePresenter {
    
    //MARK: - Properties
    private let router: HomeRouterProtocol
    private let interactor: HomeInteractorProtocol
    
    var dataSource = HomeDataSource()
    
    weak var delegate: HomePresenterDelegate?
    
    //MARK: - Inits
    init(router: HomeRouterProtocol, interactor: HomeInteractorProtocol) {
        self.router = router
        self.interactor = interactor
        
        setupDataSource()
    }
}

// MARK: - HomePresenterProtocol
extension HomePresenter: HomePresenterProtocol {
    
    func show() -> HomeViewController {
        
        router.show(presenter: self)
    }
    
    func fetchPokemon(offset: Int?) {
        
        delegate?.showLoading()
        
        if offset == 0 {
            
            interactor.fetchPokemon(offset: offset) { [weak self] pokemones in

                self?.delegate?.hideLoading()
                let pokemonesModel = pokemones.map({ PokemonModel($0)})
                self?.dataSource.reloadPokemones(pokemonesModel)
                self?.delegate?.reloadData()
            }
        } else {
        
            interactor.fetchPokemon(offset: offset) { [weak self] pokemones in
                self?.delegate?.hideLoading()
                let pokemonesModel = pokemones.map({ PokemonModel($0)})
                self?.dataSource.appendPokemones(pokemonesModel)
                self?.delegate?.reloadData()
            }
        }
    }
    
    func changeRowsFirts() {
        dataSource.numRows = 2
    }
    
    func changeRows() {
        dataSource.numRows = dataSource.numRows == 1 ? 2 : 1
    }
}

//MARK: - Private
private extension HomePresenter {
    
    func setupDataSource() {
        
        dataSource.reloadColletionView = { [unowned self] offset in
            
            self.fetchPokemon(offset: offset)
        }
        
        dataSource.pokemonTappedCompletion = { [unowned self] pokemon in
            
            self.router.showDetails(pokemonId: pokemon.id)
       }
    }
    
}
