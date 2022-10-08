import UIKit

final class LoadingView: UIView {
    
    //MARK: - Initis
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
}

//MARK: - Publics
extension LoadingView {
    
    func showLoading() {
    }
}

//MARK: - Privates
private extension LoadingView {
    
    private func commonInit(){
        
        guard let viewToAdd = Bundle.main.loadNibNamed(LoadingView.identifier, owner: self, options: nil),
              let contenView = viewToAdd.first as? UIView else { return }
        
        addSubview(contenView)
        contenView.anchorTo(parentView: self)
    }
}

