import UIKit

protocol DetailsViewDisplay: AnyObject {
  func load()
  func stop()
  func displayInformations(model: DetailModel)
}

// MARK: - Class

final class DetailsViewController: UIViewController {
  
  // MARK: - Private properties
  
  private let containerView = DetailsView()
  private var viewModel: DetailsViewModelProtocol
  
  // MARK: - Initializer
  
  init(viewModel: DetailsViewModelProtocol) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    viewModel.getPhoto()
    view.backgroundColor = UIColor.white
    view.addSubviews(containerView)
    containerView.anchorEqualTo(view: view)
  }
}

// MARK: - DetailsViewDisplay

extension DetailsViewController: DetailsViewDisplay, Loading {
  func displayInformations(model: DetailModel) {
    containerView.configure(model: model)
  }
  
  func load() {
    startLoading()
  }
  
  func stop() {
    stopLoading()
  }
}


