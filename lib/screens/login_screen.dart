import 'package:flutter/material.dart';
import 'package:flutter_bloc_notes_app/widgets/email_text_field.dart';
import 'package:flutter_bloc_notes_app/widgets/login_button.dart';
import 'package:flutter_bloc_notes_app/widgets/password_text_field.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({
    required this.onLoginTapped,
    super.key,
  });

  final OnLoginTapped onLoginTapped;

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          EmailTextField(emailController: emailController),
          PasswordTextField(passwordController: passwordController),
          LoginButton(
            emailController: emailController,
            passwordController: passwordController,
            onLoginTapped: onLoginTapped,
          ),
        ],
      ),
    );
  }
}
