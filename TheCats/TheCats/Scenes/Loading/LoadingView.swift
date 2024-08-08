import UIKit

// MARK: - Class

 final class UDSLoadingView: UIView {

  // MARK: - Private properties
  
  private let backgroundView = UIView()
  
  private let contentView: UIView = {
    let view = UIView()
    return view
  }()
  
  private let activityLoader: UIActivityIndicatorView = {
    let activity = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    activity.hidesWhenStopped = true
    return activity
  }()
  
  // MARK: - Life Cicle
  
   init() {
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
    contentView.addSubviews(activityLoader)
    backgroundView.addSubviews(contentView)
    addSubviews(backgroundView)
  }
  
  func setupConstraints() {
    backgroundView.anchorEqualTo(view: self)
    NSLayoutConstraint.activate([
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
