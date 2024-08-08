import UIKit

// MARK: - Public protocol

protocol Loading: AnyObject {
  func startLoading()
  func stopLoading(completion: (() -> Void)?)
}

// MARK: - Public extension

extension Loading where Self: UIViewController {
  
  // MARK: - Public methods
  
  func startLoading() {
    let loader = UDSLoadingView()
    loader.alpha = 0
    
    view.addSubview(loader)
    
    guard loader.superview != nil else { return }
    
    loader.anchorEqualTo(view: view)
    
    UIView.animate(withDuration: 0.3, delay: 0, options: UIView.AnimationOptions.curveEaseInOut) {
      loader.alpha = 1
    }
  }
  
  func stopLoading(completion: (() -> Void)? = nil) {
    DispatchQueue.main.async {
      let loaders = self.view.subviews.filter({ $0 is UDSLoadingView })
      
      guard !loaders.isEmpty else {
        completion?()
        return
      }
      
      for (index, loader) in loaders.enumerated() {
        UIView.animate(withDuration: 0.3, delay: 0, options: UIView.AnimationOptions.curveEaseInOut) {
          loader.alpha = 0
        } completion: { finished in
          guard finished else { return }
          loader.removeFromSuperview()
          if index == loaders.count - 1 {
            completion?()
          }
        }
      }
    }
  }
}
