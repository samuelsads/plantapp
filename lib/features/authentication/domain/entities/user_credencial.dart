import 'package:equatable/equatable.dart';

///Represents a user credendial entity
class UserCredencial extends Equatable {
  /// Constructs a new intance of [UserCredential]

  const UserCredencial({
    required this.uid,
    required this.email,
    required this.emailVerified,
    required this.displayName,
    required this.photoURL,
    required this.isAnonymous,
  });

  /// [uid] is the unique identifier of the user
  final String uid;

  /// [email] is the email of the user
  final String email;

  /// [emailVerified] is the email verified of the user
  final bool emailVerified;

  /// [displayName] is the display name of the user
  final String displayName;

  /// [photoURL] is the photo url of the user
  final String photoURL;

  /// [isAnonymous] is the is anonymous of the user
  final bool isAnonymous;

  @override
  List<Object?> get props => [
        uid,
        email,
        emailVerified,
        displayName,
        photoURL,
        isAnonymous,
      ];
}
