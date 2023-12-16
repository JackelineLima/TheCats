import UIKit

// MARK: - Public cslass

public final class UDSLoadingView: UIView {

  // MARK: - Private properties
  
  private let backgroundView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let contentView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let activityLoader: UIActivityIndicatorView = {
    let activity = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    activity.hidesWhenStopped = true
    activity.translatesAutoresizingMaskIntoConstraints = false
    return activity
  }()
  
  // MARK: - Life Cicle
  
  public init() {
    super.init(frame: CGRect.zero)
    buildLayout()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) { nil }
}

// MARK: - Private methods

private extension UDSLoadingView  {
  func buildLayout() {
    buildViewHierarchy()
    setupConstraints()
    configureViews()
  }
  
  func buildViewHierarchy() {
    contentView.addSubview(activityLoader)
    backgroundView.addSubview(contentView)
    addSubview(backgroundView)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      backgroundView.topAnchor.constraint(equalTo: topAnchor),
      backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
      backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
      backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
      
      contentView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
      contentView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
      contentView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
      contentView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
      
      activityLoader.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      activityLoader.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
      activityLoader.heightAnchor.constraint(equalToConstant: 48),
      activityLoader.widthAnchor.constraint(equalToConstant: 48),
    ])
  }
  
  func configureViews() {
    activityLoader.startAnimating()
    activityLoader.color = .blue
  }
}
