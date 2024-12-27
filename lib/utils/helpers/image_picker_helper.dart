// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:plant_app/core/presentation/widgets/dialogs/select_media_dialog.dart';
import 'package:plant_app/utils/enums/select_media_option.dart';

/// A helper class to pick images from gallery or files
class ImagePickerHelper {
  /// Function to pick images from gallery or files
  ///
  /// Returns a list of [File] objects if images are selected
  Future<List<File>?> pickImages(BuildContext context,
      {void Function()? onMaxLimitExceed, int maxLimit = 1}) async {
    final mediaOption = await _showSelectMediaDialog(context);
    if (mediaOption == SelectMediaOption.gallery) {
      // Open gallery

      return await _pickImageFromGallery(
          maxLimit: maxLimit, onMaxLimitExceed: onMaxLimitExceed);
    } else if (mediaOption == SelectMediaOption.files) {
      // Open files
      return await _pickImagesFromFiles(
          maxLimit: maxLimit, onMaxLimitExceed: onMaxLimitExceed);
    }
    return null;
  }

  Future<SelectMediaOption?> _showSelectMediaDialog(
          BuildContext context) async =>
      await showDialog<SelectMediaOption>(
        context: context,
        builder: (BuildContext context) => const SelectMediaDialog(),
      );

  Future _pickImageFromGallery(
      {required int maxLimit,
      required void Function()? onMaxLimitExceed}) async {
    final imagePicker = ImagePicker();

    if (maxLimit == 1) {
      final image = await imagePicker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        return [File(image.path)];
      }
    } else {
      final images =
          await ImagePicker().pickMultiImage(limit: maxLimit, imageQuality: 85);

      if (images.isNotEmpty) {
        if (images.length >= maxLimit) {
          onMaxLimitExceed?.call();
        }

        final limitedList =
            images.length >= maxLimit ? images.sublist(0, maxLimit) : images;

        return await compressImagesFromGalery(limitedList);
      }
    }
  }

  Future _pickImagesFromFiles(
      {required int maxLimit,
      required void Function()? onMaxLimitExceed}) async {
    final result = await FilePicker.platform.pickFiles(
      compressionQuality: 85,
      type: FileType.custom,
      allowMultiple: maxLimit == 1 ? false : true,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );
    if (result != null) {
      if (result.paths.length >= maxLimit) {
        onMaxLimitExceed?.call();
      }

      final limitedList = result.paths.length >= maxLimit
          ? result.paths.sublist(0, maxLimit)
          : result.paths;

      return await compressImagesFromFiles(limitedList);
    }
  }

  /// Function to pick an audio file from files
  Future<File?> pickAudioFromFiles() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'mpeg',
        'wav',
        'mp3',
        'x-wav',
        'x-aiff',
        'aiff',
        'flac',
        'ogg',
        'x-ms-wma',
        'aac',
        'x-m4a'
      ],
    );
    if (result != null && result.paths.isNotEmpty) {
      return result.paths.map((path) => File(path!)).toList().first;
    }
    return null;
  }

  ///compress imagen from files
  Future<List<File>> compressImagesFromFiles(List<String?> limitedList) async =>
      await Future.wait(
        limitedList.map((path) => compressFile(XFile(path!))).toList(),
      );

  ///Function to compres Images from galery
  Future<List<File>> compressImagesFromGalery(List<XFile> limitedList) async =>
      Future.wait(
        limitedList.map(compressFile).toList(),
      );

  ///Function to Compress File
  Future<File> compressFile(XFile xfile) async {
    final File file = File(xfile.path);
    final result = await FlutterImageCompress.compressWithFile(
      file.absolute.path,
      minWidth: 2300,
      minHeight: 1500,
      quality: 90,
    );
    return convertUint8ListToFile(result!, xfile.name);
  }

  ///Function convert Uint8 to file
  Future<File> convertUint8ListToFile(Uint8List data, String fileName) async {
    final tempDir = await getTemporaryDirectory();

    final filePath = path.join(tempDir.path, fileName);

    final file = File(filePath);

    await file.writeAsBytes(data);

    return file;
  }
}
