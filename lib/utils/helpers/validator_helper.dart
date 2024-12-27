import 'package:plant_app/l10n/app_localizations.dart';

/// Validates the strength of a password based on various criteria.
///
/// Checks if the password contains at least one uppercase letter, one lowercase letter,
/// one digit, and one special character from the set [!@#$%^&*(),.?":{}|<>].
///
/// Returns `true` if the password meets all the criteria, otherwise `false`.
bool passwordValidator(String password) {
  final hasMinLength = password.length >= 8;
  final hasUpperCase = RegExp(r'[A-Z]').hasMatch(password);
  final hasLowerCase = RegExp(r'[a-z]').hasMatch(password);
  final hasDigits = RegExp(r'[0-9]').hasMatch(password);
  final hasSpecialCharacters =
      RegExp(r'[!@#$%^&*(),.?":{}+|<>-]').hasMatch(password);
  // Return true if all criteria are met
  return hasMinLength &&
      hasUpperCase &&
      hasLowerCase &&
      hasDigits &&
      hasSpecialCharacters;
}

/// Validates the format of an email address.
///
/// Uses a regular expression to validate whether the given string matches
/// the typical format of an email address.
///
/// Returns `true` if the email address format is valid, otherwise `false`.
bool emailValidator(String email) {
  // Use a regular expression to validate the email format
  final emailRegExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  return emailRegExp.hasMatch(email);
}

/// Validates a string based on specified criteria.
///
/// The [value] parameter is the string to be validated.
/// The [required] parameter specifies whether the string is required or not.
/// The [minLength] parameter specifies the minimum length of the string (optional).
/// The [password] parameter specifies whether the string should adhere to password validation rules (optional).
/// The [email] parameter specifies whether the string should adhere to email validation rules (optional).
/// The [appLocalizations] parameter provides localized error messages.
///
/// Returns `null` if the string is valid, otherwise returns an error message.
String? validatorHelper({
  required String value,
  bool required = false,
  int? minLength,
  bool password = false,
  bool email = false,
  required AppLocalizations appLocalizations,
  String? repeatedPassword,
}) {
  if (required && value.isEmpty) {
    return appLocalizations.errorRequired;
  }

  if (minLength != null && value.length < minLength) {
    return '${appLocalizations.errorLength} $minLength.';
  }

  if (password) {
    final List<String> passwordErrors = [];

    if (value.length < 8) {
      passwordErrors.add(appLocalizations.errorPasswordLength);
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      passwordErrors.add(appLocalizations.errorPasswordUppercase);
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      passwordErrors.add(appLocalizations.errorPasswordLowercase);
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      passwordErrors.add(appLocalizations.errorPasswordDigit);
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}+|<>-]').hasMatch(value)) {
      passwordErrors.add(appLocalizations.errorPasswordSpecialCharacter);
    }

    if (passwordErrors.isNotEmpty) {
      return passwordErrors.join('\n');
    }
  }

  if (email && !emailValidator(value)) {
    return appLocalizations.errorEmail;
  }

  if (repeatedPassword != null && value != repeatedPassword) {
    return appLocalizations.errorPasswordsDoNotMatch;
  }

  return null;
}
