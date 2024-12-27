///Model class representing a Login Request
class LoginModelRequest {
  /// [LoginModelRequest] is a model class representing a Login Request
  const LoginModelRequest({
    required this.email,
    required this.password,
  });

  /// [email] is the email of the user
  final String email;

  /// [password] is the password of the user
  final String password;

  /// [toJson] is a method that converts the model to a json object
  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}
