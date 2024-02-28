import 'package:flutter/material.dart';

/// Signature for a function that builds a map of option titles to their corresponding values.
typedef DialogOptionBuilder<T> = Map<String, T?> Function();

/// Displays a generic dialog with customizable options and returns the selected option's value.
/// 
/// The [context] is required for building and showing the dialog.
/// The [title] and [content] are used to set the title and content of the dialog.
/// The [optionsBuilder] is a function that returns a map of option titles to their values.
/// 
/// Returns a [Future] that completes with the value of the selected option, or null if the dialog is dismissed.
 Future<T?> showGenericDialog<T>({
  required BuildContext context,
  required String title,
  required String content,
  required DialogOptionBuilder optionsBuilder,
}) {
  final options = optionsBuilder();
  return showDialog<T?>(
    context: context,
    builder: (context) {
      return AlertDialog.adaptive(
        title: Text(title),
        content: Text(content),
        actions: options.keys.map((optionTitle) {
          final value = options[optionTitle];
          return TextButton(
            onPressed: () {
              if (value != null) {
                Navigator.of(context).pop(value);
              } else {
                Navigator.of(context).pop();
              }
            },
            child: Text(optionTitle),
          );
        }).toList(),
      );
    },
  );
}
