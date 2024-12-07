import 'package:plant_app/features/authentication/domain/entities/user_credencial.dart';

/// [UserCredentialModel] is a model class representing a User Credential
class UserCredentialModel extends UserCredencial {
  /// [UserCredentialModel] is a model class representing a User Credential
  const UserCredentialModel({
    required super.uid,
    required super.email,
    required super.emailVerified,
    required super.displayName,
    required super.photoURL,
    required super.isAnonymous,
  });

  /// [toJson] is a method that converts the model to a json object
  factory UserCredentialModel.fromJson(Map<String, dynamic> json) =>
      UserCredentialModel(
        uid: json['uid'],
        email: json['email'],
        emailVerified: json['email_verified'],
        displayName: json['display_name'],
        photoURL: json['photo_url'],
        isAnonymous: json['is_anonymous'],
      );
}
