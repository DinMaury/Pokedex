import Foundation

//MARK: - protocol
protocol HomePresenterProtocol {
    
    var dataSource: HomeDataSource { get }
    var delegate: HomePresenterDelegate? { get set }
    
    func show() -> HomeViewController
}

//MARK: - Delegate
protocol HomePresenterDelegate: AnyObject {
    
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
    
}

//MARK: - Private
private extension HomePresenter {
    
    func setupDataSource() {
            
    }
}
