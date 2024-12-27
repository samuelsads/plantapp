import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:plant_app/core/presentation/widgets/layout/image_with_delete_container.dart';
import 'package:plant_app/core/theme/app_colors.dart';
import 'package:plant_app/utils/helpers/image_picker_helper.dart';

/// A image input field with a label.
class SingleImageInput extends StatefulWidget {
  /// Creates an instance of [SingleImageInput]
  const SingleImageInput({
    super.key,
    required this.label,
    this.onImageChanged,
  });

  /// The label displayed above the text field.
  final String label;

  /// Function called when the image is changed.
  final void Function(File? file)? onImageChanged;

  @override
  State<SingleImageInput> createState() => _SingleImageInputState();
}

class _SingleImageInputState extends State<SingleImageInput> {
  File? _selectedImage;
  final ImagePickerHelper _imagePickerHelper = ImagePickerHelper();

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.darkGray,
              )),
          const SizedBox(height: 5),
          InkWell(
            onTap: () async {
              final image = await _imagePickerHelper.pickImages(context);
              if (image != null) {
                final croppedImage = await ImageCropper().cropImage(
                  sourcePath: image.first.path,
                  aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
                );
                if (croppedImage == null) {
                  return;
                }
                setState(() {
                  _selectedImage = File(croppedImage.path);
                  widget.onImageChanged?.call(_selectedImage);
                });
              }
            },
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context)
                        .colorScheme
                        .darkGray
                        .withOpacity(0.3)),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                children: [
                  Container(
                    height: 29,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .darkGray
                          .withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Row(
                      children: [
                        Text('Selecciona una imagen'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  if (_selectedImage != null) ...[
                    Expanded(
                      child: Text(
                        _selectedImage!.path.split('/').last,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ),
          if (_selectedImage != null) ...[
            const SizedBox(height: 10),
            ImageWithDeleteContainer(
              image: _selectedImage!,
              onDelete: () {
                setState(() {
                  _selectedImage = null;
                  widget.onImageChanged?.call(null);
                });
              },
            )
          ]
        ],
      );
}
