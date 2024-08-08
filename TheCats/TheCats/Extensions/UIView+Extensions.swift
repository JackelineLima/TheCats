import UIKit

extension UIView {
  func anchorEqualTo(view: UIView) {
    translatesAutoresizingMaskIntoConstraints = false
    topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
  }
  
  func addSubviews(_ views: UIView...) {
    views.forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      self.addSubview($0)
    }
  }
}
