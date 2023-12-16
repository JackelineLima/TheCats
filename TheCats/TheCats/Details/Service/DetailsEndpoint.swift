import Foundation

enum DetailsEndPoint {
  case getImage(breed: String)
}

extension DetailsEndPoint: EndpointType {
    var path: String {
      if case .getImage(_) = self {
        return "v1/images/search"
      }
      return ""
    }

  var task: HTTPTask {
    switch self {
    case let .getImage(breed):
      return .requestParametersAndHeaders(
        bodyParameters: nil,
        bodyEncoding: .urlEncoding,
        urlParameters: ["breed_ids": breed],
        additionHeaders: ["x-api-key": "c0f41c38-f785-480d-9c66-ae2359cbaea3"])
    }
  }
}
