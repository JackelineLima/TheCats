import Foundation

protocol DetailsServicing {
  func getPhoto(breed: String, completion: @escaping (Result<[CatImage], NetworkResponse>) -> Void)
}

final class DetailsService: DetailsServicing {
  
  func getPhoto(breed: String, completion: @escaping (Result<[CatImage], NetworkResponse>) -> Void) {
    let endpoint = DetailsEndPoint.getImage(breed: breed)
    NetworkManager().execute(endpoint: endpoint, completion: completion)
  }
}
