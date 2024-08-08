import Foundation

protocol DetailsServicing {
  func getPhoto(breed: String, completion: @escaping (Result<[CatImage], NetworkResponse>) -> Void)
}

final class DetailsService: DetailsServicing {
  
  private let networkManager: NetworkManager
  
  init(networkManager: NetworkManager = NetworkManager()) {
    self.networkManager = networkManager
  }
  
  func getPhoto(breed: String, completion: @escaping (Result<[CatImage], NetworkResponse>) -> Void) {
    let endpoint = DetailsEndPoint.getImage(breed: breed)
    networkManager.execute(endpoint: endpoint, completion: completion)
  }
}
