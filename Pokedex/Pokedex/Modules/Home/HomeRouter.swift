import UIKit

protocol HomeRouterProtocol {
    
    func show(presenter: HomePresenterProtocol) -> HomeViewController
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
}
