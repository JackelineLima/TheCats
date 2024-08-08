import UIKit

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
  private let scheduler: Scheduler
  
  init(service: HomeServicing, coordinator: HomeCoordinator, scheduler: Scheduler = DispatchQueue.main) {
    self.service = service
    self.coordinator = coordinator
    self.scheduler = scheduler
  }
}

// MARK: - HomeViewModelProtocol

extension HomeViewModel: HomeViewModelProtocol {
  func getCats(limit: Int, page: Int) {
    service.getCats(limit: limit, page: page) { [weak self] (response: Result<[Cats], NetworkResponse>) in
      guard let self = self else { return }
      self.scheduler.schedule {
        switch response {
        case .success(let cats):
          self.cats = cats
          self.viewController?.reloadTableView()
        case .failure:
          self.coordinator.openError(title: "Tente novamente mais tarde!")
        }
      }
    }
  }
  
  var items: [Cats] {
    return cats
  }
  
  func didSelectRowAt(item: Cats) {
    coordinator.openDetails(item: item)
  }
}
