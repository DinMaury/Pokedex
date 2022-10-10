import UIKit

final class HomeViewController: UIViewController {
    

    //MARK: - View
    @IBOutlet weak var collectionView: UICollectionView!
    
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
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        collectionView.collectionViewLayout = layout
        collectionView.register(.init(nibName: PokemonCell.identifier, bundle: nil), forCellWithReuseIdentifier: PokemonCell.identifier)
        
        collectionView.dataSource = presenter.dataSource
        collectionView.delegate = presenter.dataSource
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        addBarButton()
        presenter.changeRowsFirts()
        self.collectionView.reloadData()
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
        
        DispatchQueue.main.async {
            
            self.collectionView.reloadData()
        }
    }
    
    func reloadDatacollectionView(indexPath: IndexPath) {
        
        DispatchQueue.main.async { 
            
            self.collectionView.reloadItems(at: [indexPath])
        }
    }
    
    func showError(title: String, message: String) {
        print(message)
    }
    
    func addBarButton() {
        
        let changeRow: UISegmentedControl = {
            let sc = UISegmentedControl(items: ["Two Items","One Item"])
            sc.translatesAutoresizingMaskIntoConstraints = false
            sc.addTarget(self, action: #selector(changeRows), for: .valueChanged)
            sc.selectedSegmentIndex = 0
            return sc
        }()
        navigationItem.titleView = changeRow
        
    }
    
    @objc func changeRows() {
        
        self.presenter.changeRows()
        self.collectionView.reloadData()
    }
        
}
