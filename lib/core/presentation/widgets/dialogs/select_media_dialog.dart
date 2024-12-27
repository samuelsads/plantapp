import 'package:flutter/material.dart';
import 'package:plant_app/utils/enums/select_media_option.dart';
import 'package:plant_app/utils/extensions/build_context_extension.dart';

/// A widget that displays a dialog for selecting media.
class SelectMediaDialog extends StatelessWidget {
  /// Creates a [SelectMediaDialog].
  const SelectMediaDialog({super.key});

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Text(context.localizations.image),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.photo),
              title: Text(context.localizations.fromGallery),
              onTap: () {
                Navigator.of(context).pop(SelectMediaOption.gallery);
              },
            ),
            ListTile(
              leading: const Icon(Icons.folder),
              title: Text(context.localizations.fromFiles),
              onTap: () {
                Navigator.of(context).pop(SelectMediaOption.files);
              },
            ),
          ],
        ),
      );
}
