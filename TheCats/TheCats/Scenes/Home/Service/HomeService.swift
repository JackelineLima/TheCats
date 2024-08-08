import Foundation

protocol Scheduler {
    func schedule(task: @escaping () -> Void)
}

extension DispatchQueue: Scheduler {
    func schedule(task: @escaping () -> Void) {
        async(execute: task)
    }
}

protocol HomeServicing {
  func getCats(limit: Int, page: Int, completion: @escaping (Result<[Cats], NetworkResponse>) -> Void)
}

final class HomeService: HomeServicing {
  
  private let networkManager: NetworkManager
  
  init(networkManager: NetworkManager = NetworkManager()) {
    self.networkManager = networkManager
  }
  
  func getCats(limit: Int, page: Int, completion: @escaping (Result<[Cats], NetworkResponse>) -> Void) {
    let endpoint = HomeEndPoint.get(limit: limit, page: page)
    networkManager.execute(endpoint: endpoint, completion: completion)
  }
}
