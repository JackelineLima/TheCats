import UIKit

enum DetailsFactory {
  static func make(item: Cats) -> UIViewController {
    let service = DetailsService()
    let viewModel = DetailsViewModel(service: service, cat: item)
    let controller = DetailsViewController(viewModel: viewModel)
    
    viewModel.viewController = controller
    return controller
  }
}

