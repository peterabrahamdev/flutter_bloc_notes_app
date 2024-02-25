import 'package:flutter/foundation.dart' show immutable;

/// Represents a handle obtained after successful login.

/// An immutable class that holds a login token.

@immutable
class LoginHandle {
  /// The login token.

  final String token;

  /// Creates a new [LoginHandle] instance.

  const LoginHandle({
    required this.token,
  });

  /// Creates a [LoginHandle] instance with the token "foobar".

  const LoginHandle.fooBar() : token = 'foobar';

  @override
  bool operator ==(covariant LoginHandle other) => token == other.token;

  @override
  int get hashCode => token.hashCode;

  @override
  String toString() => 'LoginHandle (token = $token)';
}

/// Represents different types of errors related to [LoginHandle] operations.

enum LoginErrors {
  /// Error indicating an invalid LoginHandle object.
  invalidHandle
}

/// Represents a single note with a title.

/// An immutable class that holds a title of a note.
@immutable
class Note {
  /// The title of the note.

  final String title;

  /// Creates a new [Note] instance.
  
  const Note({
    required this.title,
  });

  @override
  String toString() => 'Note (title = $title)';
}

/// A list of mock notes for testing purposes.

final mockNotes = Iterable.generate(
  3,
  (i) => Note(title: '${i + 1}'),
);
