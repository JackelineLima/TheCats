import UIKit

protocol HomeViewDisplay: AnyObject {
  func reloadTableView()
}

// MARK: - Class

final class HomeViewController: UITableViewController {
  
  // MARK: - Private properties
  
  private var viewModel: HomeViewModelProtocol
  
  // MARK: - Initializer
  
  init(viewModel: HomeViewModelProtocol) {
    self.viewModel = viewModel
    super.init(style: .grouped)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureLayout()
    viewModel.getCats(limit: 30, page: 0)
  }
}

// MARK: - HomeViewDisplay

extension HomeViewController: HomeViewDisplay {
  func reloadTableView() {
    tableView.reloadData()
  }
}

// MARK: - DataSource

extension HomeViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.items.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else {
      return UITableViewCell()
    }
    cell.configure(title: viewModel.items[indexPath.row].name)
    return cell
  }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      return "RAÇAS DE GATOS"
  }
}

// MARK: - Delegate

extension HomeViewController {
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    viewModel.didSelectRowAt(item: viewModel.items[indexPath.row])
  }
}

// MARK: - Private methods

private extension HomeViewController {
  func configureLayout() {
    title = "The Cats"
    view.backgroundColor = UIColor.secondarySystemBackground
    tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
    tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
  }
}


