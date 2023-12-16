import Foundation

protocol HomeServicing {
  func getCats(limit: Int, page: Int, completion: @escaping (Result<[Cats], NetworkResponse>) -> Void)
}

final class HomeService: HomeServicing {
  
  func getCats(limit: Int, page: Int, completion: @escaping (Result<[Cats], NetworkResponse>) -> Void) {
    let endpoint = HomeEndPoint.get(limit: limit, page: page)
    NetworkManager().execute(endpoint: endpoint, completion: completion)
  }
}
