/// Enum representing the progress status of a request.
enum RequestProgressStatus {
  /// Indicates that no request is in progress.
  nothing,

  /// Indicates that a request is currently loading.
  loading,

  /// Indicates that a request has been successfully completed.
  success,

  /// Indicates that a request has encountered an error.
  error,
}

/// Extension on [RequestProgressStatus] providing convenience methods.
extension RequestProgressStatusExtension on RequestProgressStatus {
  /// Returns `true` if the status is [RequestProgressStatus.nothing], `false` otherwise.
  bool get isNothing => this == RequestProgressStatus.nothing;

  /// Returns `true` if the status is [RequestProgressStatus.loading], `false` otherwise.
  bool get isLoading => this == RequestProgressStatus.loading;

  /// Returns `true` if the status is [RequestProgressStatus.success], `false` otherwise.
  bool get isSuccess => this == RequestProgressStatus.success;

  /// Returns `true` if the status is [RequestProgressStatus.error], `false` otherwise.
  bool get isError => this == RequestProgressStatus.error;
}
