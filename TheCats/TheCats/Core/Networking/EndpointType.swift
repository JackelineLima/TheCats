import Foundation

protocol EndpointType {
  var baseURL: String { get }
  var path: String { get }
  var httpMethod: HTTPMethod { get }
  var task: HTTPTask { get }
  var headers: HTTPHeaders? { get }

  func getFullURL() -> URL
}

extension EndpointType {
  
  var baseURL: String {
    guard let url = Bundle.main.infoDictionary?["BASE_URL"] as? String else {
      fatalError("baseURL could not be configured.")
    }
    return url
  }
  
  private var baseURLDefault: URL {
    guard let url = URL(string: baseURL) else {
      fatalError("URL not found.")
    }
    return url
    
  }
  
  var httpMethod: HTTPMethod {
    .get
  }
  
  var task: HTTPTask {
    .request
  }
  
  var headers: HTTPHeaders? {
    nil
  }
  
  func getFullURL() -> URL {
    return baseURLDefault.appendingPathComponent(path)
  }
}
