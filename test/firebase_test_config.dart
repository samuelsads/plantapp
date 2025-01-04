import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

typedef Callback = void Function(MethodCall call);

void setupFirebaseMocks([Callback? customHandlers]) {
  TestWidgetsFlutterBinding.ensureInitialized();

  // setupFirebaseCoreMocks();
}

Future<T> neverEndingFuture<T>() async {
  // ignore: literal_only_boolean_expressions
  while (true) {
    await Future.delayed(const Duration(minutes: 5));
  }
}