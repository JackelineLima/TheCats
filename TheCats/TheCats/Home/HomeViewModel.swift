import UIKit

// MARK: - HomeViewModelProtocol

protocol HomeViewModelProtocol: AnyObject {
  func getCats(limit: Int, page: Int)
  var items: [Cats] { get }
  func didSelectRowAt(item: Cats)
}

// MARK: - Class

final class HomeViewModel {
  
  weak var viewController: HomeViewDisplay?
  private var cats: [Cats] = []
  private let service: HomeServicing
  private let coordinator: HomeCoordinator
  
  init(service: HomeServicing, coordinator: HomeCoordinator) {
    self.service = service
    self.coordinator = coordinator
  }
}

// MARK: - HomeViewModelProtocol

extension HomeViewModel: HomeViewModelProtocol {
  func getCats(limit: Int, page: Int) {
    service.getCats(limit: limit, page: page) { [weak self] (response: Result<[Cats], NetworkResponse>) in
      guard let self = self else { return }
      switch response {
      case .success(let cats):
        self.cats = cats
        self.viewController?.reloadTableView()
      case .failure:
        self.viewController?.displayError(title: "Tente novamente mais tarde!")
      }
    }
  }
  
  var items: [Cats] {
    return cats
  }
  
  func didSelectRowAt(item: Cats) {
    coordinator.presentDetails(item: item)
  }
}
