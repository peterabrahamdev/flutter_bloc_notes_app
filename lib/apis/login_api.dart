import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc_notes_app/models.dart';

@immutable
abstract class LoginApiProtocol {
  const LoginApiProtocol();

  // When the login api is used, the login function must be implemented
  Future<LoginHandle?> login({
    required String email,
    required String password,
  });
}
