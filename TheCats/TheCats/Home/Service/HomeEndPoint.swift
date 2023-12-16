enum HomeEndPoint {
  case get(limit: Int, page: Int)
}

extension HomeEndPoint: EndpointType {
    var path: String {
      if case .get(_, _) = self {
        return "v1/breeds"
      }
      return ""
    }
  
  var task: HTTPTask {
    switch self {
    case let .get(limit, page):
      return .requestParametersAndHeaders(
        bodyParameters: nil,
        bodyEncoding: .urlEncoding,
        urlParameters: ["limit": limit, "page": page],
        additionHeaders: nil)
    }
  }
}
