/// Enum for content type
enum ContentType {
  /// JSON content type
  json,

  /// Form data content type
  multipart,
}

/// Extension on [ContentType] providing convenience methods.
extension ContentTypeExtension on ContentType {
  /// Returns `true` if the content type is [ContentType.json], `false` otherwise.
  bool get isJson => this == ContentType.json;

  /// Returns `true` if the content type is [ContentType.multipart], `false` otherwise.
  bool get isMultipart => this == ContentType.multipart;
}
