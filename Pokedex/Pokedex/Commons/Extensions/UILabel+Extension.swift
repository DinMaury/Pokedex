import UIKit
import Alamofire

extension UILabel {
    
    func downloadDescription(id: String) {
        
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon-species/\(id)/") else { return }
        
        AF.request(url) .responseDecodable(of: PokemonDescription.self) { [weak self] response in

            switch response.result {
            case .success(let data):
                
                let charts = data.flavor_text_entries[1].flavor_text.split(separator: "\n")
                var description: String = ""
                for chart in charts {
                    description = description + chart
                }
                self?.text = description

            default:
                break
            }
        }
    }
}
