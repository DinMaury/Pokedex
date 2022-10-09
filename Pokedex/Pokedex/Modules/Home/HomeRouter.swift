import UIKit

protocol HomeRouterProtocol {
    
    func show(presenter: HomePresenterProtocol) -> HomeViewController
    func showDetails(pokemonId: String)
}


final class HomeRouter {
    
    //MARK: - Properties
    private weak var viewController: UIViewController?
    
}

// MARK: - HomeRouterProtocol
extension HomeRouter: HomeRouterProtocol {
    
    func show(presenter: HomePresenterProtocol) -> HomeViewController {
        
        let viewController = HomeViewController(presenter)
        
        self.viewController = viewController
        
        return viewController
    }
    
    func showDetails(pokemonId: String) {
        guard let navigationController = viewController?.navigationController else { return }
        
        let module = HomeDetailModule(pokemonId: pokemonId)
        module.show(in: navigationController)
    }
}
