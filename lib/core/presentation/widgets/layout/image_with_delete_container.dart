import 'dart:io';

import 'package:flutter/material.dart';
import 'package:plant_app/core/theme/app_colors.dart';

/// A widget that displays an image with a delete button.
class ImageWithDeleteContainer extends StatelessWidget {
  /// Creates an [ImageWithDeleteContainer].
  const ImageWithDeleteContainer({
    super.key,
    required this.image,
    required this.onDelete,
    this.onSeleted,
    this.isSelected = false,
  });

  /// The image to be displayed.
  final File image;

  /// Callback function that is called when the delete button is tapped.
  final void Function() onDelete;

  /// Callback function that is called when the image is tapped.
  final void Function()? onSeleted;

  /// Whether the image is selected.
  final bool isSelected;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          InkWell(
            onTap: onSeleted,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: onSeleted != null && isSelected
                  ? BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        width: 3,
                      ),
                    )
                  : null,
              child: Image.file(
                File(image.path),
                width: 130,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 3,
            right: 3,
            child: InkWell(
              onTap: onDelete,
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.white.withOpacity(0.4),
                  shape: BoxShape.circle,
                ),
                child:
                    const Icon(Icons.delete_outline_rounded, color: Colors.red),
              ),
            ),
          ),
        ],
      );
}
