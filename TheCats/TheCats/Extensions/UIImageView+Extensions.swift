import UIKit

internal extension UIImageView {
  /// Passa a url da imagem a ser baixada
  /// a própria função seta no .image a imagem baixada
  /// Exemplo de uso:
  /// myImageView.downloaded(from: url)
  func downloaded(from url: URL) {
    URLSession.shared.dataTask(with: url) { data, response, error in
      guard
        let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
        let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
        let data = data, error == nil,
        let image = UIImage(data: data)
      else { return }
      DispatchQueue.main.async { [weak self] in
        self?.image = image
      }
    }.resume()
  }
  
  /// Passa uma string contendo o link da imagem a ser baixada
  /// a própria função seta no .image a imagem baixada
  /// Exemplo de uso:
  /// myImageView.downloaded(from: link)
  func downloaded(from link: String) {
    guard let url = URL(string: link) else { return }
    downloaded(from: url)
  }
}
