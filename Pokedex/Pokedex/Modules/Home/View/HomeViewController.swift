import UIKit

final class HomeViewController: UIViewController {

    //MARK: - Properties
    private var presenter: HomePresenterProtocol
    
    //MARK: - Inits
    init(_ presenter: HomePresenterProtocol) {
        
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
        
    }
}

//MARK: - HomePresenterDelegate
extension HomeViewController: HomePresenterDelegate {
    
}
