import 'package:firebase_auth/firebase_auth.dart';
import 'package:plant_app/features/authentication/domain/entities/user_credencial.dart'
    as user_credencial;

/// Maps a User object from FirebaseAuth to a UserCredencial entity.
user_credencial.UserCredencial toUserCredentialMapper({required User model}) =>
    user_credencial.UserCredencial(
        uid: model.uid,
        email: model.email ?? 'empty email',
        photoURL: model.photoURL ?? '',
        displayName: model.displayName ?? '',
        emailVerified: model.emailVerified,
        isAnonymous: model.isAnonymous);
