import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
  var navigationController: UINavigationController?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    let homeViewController = HomeFactory.make()
    let navController = UINavigationController(rootViewController: homeViewController)
    self.navigationController = navController
    window = UIWindow(windowScene: windowScene)
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
  }
}

