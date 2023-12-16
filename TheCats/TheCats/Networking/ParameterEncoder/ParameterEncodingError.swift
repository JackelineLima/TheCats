public enum ParameterEncodingError: String, Error {
  case parametersNil = "Parameters were nil."
  case encodingFailed = "Parameter encoding failed."
  case missingURL = "URL is nil."
}
