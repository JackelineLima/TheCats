import UIKit

// MARK: - Class

final class HomeTableViewCell: UITableViewCell {
  
  // MARK: - Internal properties
  
  static let identifier = "HomeTableViewCell"
  
  // MARK: - Private properties
  
  private let containerView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.white
    return view
  }()
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.font = .systemFont(ofSize: 16, weight: UIFont.Weight.bold)
    return label
  }()
  
  private let iconImageView: UIImageView = {
    let image = UIImageView()
    image.image = UIImage(named: "uds-chevron-right")
    image.tintColor = UIColor.black
    return image
  }()
  
  // MARK: - Initializer
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    buildViewHierachy()
    buildViewConstraints()
    buildLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Internal methods

extension HomeTableViewCell {
  func configure(title: String) {
    titleLabel.text = title
  }
}

// MARK: - Private methods

private extension HomeTableViewCell {
  func buildViewHierachy() {
    contentView.addSubviews(containerView)
    containerView.addSubviews(titleLabel, iconImageView)
  }
  
  func buildViewConstraints() {
    NSLayoutConstraint.activate([
      containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
      containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
      containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      
      titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
      titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
      titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
      titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: iconImageView.leadingAnchor, constant: -8),
      
      iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      iconImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8)
    ])
  }
  
  func buildLayout() {
    containerView.layer.cornerRadius = 8
    contentView.backgroundColor = UIColor.secondarySystemBackground
  }
}
