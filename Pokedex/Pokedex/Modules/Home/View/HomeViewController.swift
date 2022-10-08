import UIKit

final class HomeViewController: UIViewController {

    private var loadingView: LoadingView?
    
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
        presenter.fetchPokemon(offset: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
}

//MARK: - HomePresenterDelegate
extension HomeViewController: HomePresenterDelegate {
    
    func showLoading() {
        
        let loading = LoadingView()
        view.addSubview(loading)
        loading.anchorTo(parentView: view)
        loading.showLoading()
        self.loadingView = loading
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            
            self.loadingView?.isHidden = true
            self.loadingView?.removeFromSuperview()
            self.loadingView = nil
        }
    }
    
    func reloadData() {
        
    }
}
