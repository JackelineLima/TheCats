import UIKit

enum HomeFactory {
  static func make() -> UIViewController {
    let service = HomeService()
    let coordinator = HomeCoordinator()
    let viewModel = HomeViewModel(service: service, coordinator: coordinator)
    let controller = HomeViewController(viewModel: viewModel)
    
    viewModel.viewController = controller
    coordinator.viewController = controller
    
    return controller
  }
}
