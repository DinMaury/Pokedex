import UIKit
import Alamofire
import AlamofireImage

extension UIImageView {
    
    func downloadImage(id: String) {
        
        guard let url = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png") else { return }
        
        AF.request(url).responseImage { [weak self] response in
            
            switch response.result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.image = data
                }
            default:
                break
            }
        }
    }
}
