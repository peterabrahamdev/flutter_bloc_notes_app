import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc_notes_app/models.dart';

/// An abstract class defining the protocol for a login API.
///
/// Subclasses implementing this protocol must provide functionality for user login.

@immutable
abstract class LoginApiProtocol {
  /// Creates a [LoginApiProtocol] instance.
  const LoginApiProtocol();

  /// When the login api is used, the login function must be implemented
  /// 
  /// Returns a [LoginHandle] instance if the login is successful, otherwise it returns a null.
  Future<LoginHandle?> login({
    required String email,
    required String password,
  });
}

/// A concrete implementation of the [LoginApiProtocol] representing login API.
/// 
/// This class follows the singleton pattern, ensuring a single instance throughout the application.

@immutable
class LoginApi implements LoginApiProtocol {
  /// Private constructor for creating the shared instance.
  const LoginApi._sharedInstance();

  /// The shared instance of the [LoginApi].
  static const LoginApi _shared = LoginApi._sharedInstance();

  /// Factory method to get the shared instance of the [LoginApi].
  factory LoginApi() => _shared;

  /// Implements the login functionality as specified in the [LoginApiProtocol].
  /// 
  /// Simulates a delayed login response with hardcoded email and password validation.
  @override
  Future<LoginHandle?> login({
    required String email,
    required String password,
  }) =>
      Future.delayed(
        const Duration(seconds: 2),
        () => email == 'foo@bar.com' && password == 'foobar',
      ).then((isLoggedIn) => isLoggedIn ? const LoginHandle.fooBar() : null);
}
