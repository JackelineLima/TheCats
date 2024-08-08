import UIKit

// MARK: - HomeCoordinating

protocol HomeCoordinating: AnyObject {
  func openDetails(item: Cats)
  func openError(title: String)
}

// MARK: - Class

final class HomeCoordinator {
  weak var viewController: UIViewController?
}

// MARK: - HomeCoordinating

extension HomeCoordinator: HomeCoordinating {
  func openDetails(item: Cats) {
    let controller = DetailsFactory.make(item: item)
    viewController?.navigationController?.pushViewController(controller, animated: true)
  }
  
  func openError(title: String) {
    let alertController = UIAlertController(
      title: "Ops algo deu errado!",
      message: title,
      preferredStyle: .alert
    )
    let ok = UIAlertAction(title: "OK", style: .default)
    alertController.addAction(ok)
    
    viewController?.present(alertController, animated: true, completion: nil)
  }
}
