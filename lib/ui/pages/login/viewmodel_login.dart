
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plant_app/utils/constants.dart';

class ViewmodelLogin{
   Future<LoginStatus> signIn(String username, String password) async {
try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: username,
    password: password
  );
  print(FirebaseAuth.instance.currentUser?.uid);
  return LoginStatus.success;
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
    return LoginStatus.errorUserNotFound;
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
    return LoginStatus.errorWrongPassword;
  }
  return LoginStatus.error;
}
  }
}