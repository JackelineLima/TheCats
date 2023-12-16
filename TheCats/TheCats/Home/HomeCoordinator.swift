import UIKit

// MARK: - HomeCoordinating

protocol HomeCoordinating: AnyObject {
  func presentDetails(item: Cats)
}

// MARK: - Class

final class HomeCoordinator {
  weak var viewController: UIViewController?
}

// MARK: - HomeCoordinating

extension HomeCoordinator: HomeCoordinating {
  func presentDetails(item: Cats) {
    let controller = DetailsFactory.make(item: item)
    viewController?.navigationController?.pushViewController(controller, animated: true)
  }
}
