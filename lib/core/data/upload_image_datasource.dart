import 'dart:io';

/// Upload Image Datasource
abstract class UploadImageDatasource {
  /// Upload Image
  Future<String> uploadImage(File path);
}
