import Foundation

final class HomeModule {
    
    private let presenter: HomePresenterProtocol
    
    init() {
    
        presenter = HomePresenter(router: HomeRouter(), interactor: HomeInteractor())
    }
    
}

extension HomeModule {
    
    func show() -> HomeViewController {
        
        presenter.show()
    }
    
}
