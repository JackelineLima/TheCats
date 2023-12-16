import UIKit

// MARK: - Class

final class DetailsView: UIView {
  
  // MARK: - Private properties
  
  private var scrollView: UIScrollView = {
    let element = UIScrollView()
    element.translatesAutoresizingMaskIntoConstraints = false
    element.contentInsetAdjustmentBehavior = .never
    return element
  }()
  
  private var containerStackView: UIStackView = {
    let stack = UIStackView()
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .vertical
    stack.spacing = 24
    return stack
  }()
  
  private var containerView: UIView = {
    let element = UIView()
    element.translatesAutoresizingMaskIntoConstraints = false
    element.backgroundColor = UIColor.white
    element.layer.cornerRadius = 15
    element.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    return element
  }()
  
  private var stackView: UIStackView = {
    let stack = UIStackView()
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .vertical
    stack.spacing = -12
    return stack
  }()
  
  private let imageView: UIImageView = {
    let view = UIImageView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.contentMode = .scaleAspectFill
    return view
  }()
  
  private let breedView: DetailsInfoView = {
    let view = DetailsInfoView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let descriptionView: DetailsInfoView = {
    let view = DetailsInfoView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  private let temperantView: DetailsInfoView = {
    let view = DetailsInfoView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
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

extension DetailsView {
  func configure(model: DetailModel) {
    breedView.configure(title: model.titleBreed, description: model.infoBreed)
    temperantView.configure(title: model.titleTemperament, description: model.infoTemperament)
    descriptionView.configure(title: model.titleDescription, description: model.infoDescription)
    if let urlString = model.imageUrl {
      imageView.downloaded(from: urlString)
    } else {
      imageView.isHidden = true
    }
  }
}

// MARK: - Private methods

private extension DetailsView {
  func initialize() {
    addComponents()
    setupConstraints()
  }
  
  func addComponents() {
    addSubview(scrollView)
    scrollView.addSubview(stackView)
    stackView.addArrangedSubview(imageView)
    stackView.addArrangedSubview(containerView)
    containerView.addSubview(containerStackView)
    containerStackView.addArrangedSubview(breedView)
    containerStackView.addArrangedSubview(temperantView)
    containerStackView.addArrangedSubview(descriptionView)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: topAnchor),
      scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
      scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
      
      stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
      
      containerStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 24),
      containerStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -24),
      containerStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
      containerStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
      
      imageView.heightAnchor.constraint(equalToConstant: 320),
    ])
  }
}
