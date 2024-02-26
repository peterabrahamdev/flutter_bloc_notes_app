import 'package:flutter/material.dart';
import 'package:flutter_bloc_notes_app/strings.dart' show enterYourPasswordHere;

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key, required this.passwordController});
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: passwordController,
      autocorrect: false,
      obscureText: true,
      decoration: const InputDecoration(hintText: enterYourPasswordHere),
    );
  }
}
