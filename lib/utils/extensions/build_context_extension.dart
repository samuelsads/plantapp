import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// An extension on [BuildContext] to access [AppLocalizations] easily.
extension LocalizedBuildContext on BuildContext {
  /// Returns the [AppLocalizations] instance associated with this [BuildContext].
  ///
  /// Throws an exception if [AppLocalizations] cannot be found.
  AppLocalizations get localizations => AppLocalizations.of(this)!;
}
