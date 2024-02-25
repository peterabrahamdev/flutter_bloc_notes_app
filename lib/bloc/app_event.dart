part of 'app_bloc.dart';

@immutable
abstract class AppEvent {
  const AppEvent();
}

@immutable
class LoginEvent extends AppEvent {
  final String email;
  final String password;

  const LoginEvent({
    required this.email,
    required this.password,
  });
}

@immutable
class LoadNotesEvent extends AppEvent {
  const LoadNotesEvent();
}
