
import UIKit

// MARK: - Class

final class DetailsInfoView: UIView {
  
  // MARK: - Private properties

  private var stackView: UIStackView = {
    let stack = UIStackView()
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .vertical
    stack.spacing = 8
    return stack
  }()
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 20, weight: UIFont.Weight.bold)
    return label
  }()
  
  private let infoLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 16)
    label.numberOfLines = 0
    return label
  }()

  // MARK: - Initializer
  
  public init() {
    super.init(frame: CGRect.zero)
    initialize()
  }
  
  public required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Internal methods

extension DetailsInfoView {
  func configure(title: String, description: String) {
    titleLabel.text = title
    infoLabel.text = description
  }
}

// MARK: - Private methods

private extension DetailsInfoView {
  func initialize() {
    addComponents()
    setupConstraints()
  }
  
  func addComponents() {
    addSubview(stackView)
    stackView.addArrangedSubview(titleLabel)
    stackView.addArrangedSubview(infoLabel)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: topAnchor),
      stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])
  }
}
