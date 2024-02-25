import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc_notes_app/models.dart';

/// An abstract class defining the protocol for a notes API.
///
/// Subclasses implementing this protocol must provide functionality for retrieving notes.

@immutable
abstract class NotesApiProtocol {
  /// Creates a [NotesApiProtocol] instance.
  const NotesApiProtocol();

  /// Retrieves notes based on the provided [LoginHandle].
  ///
  /// Returns an iterable of [Note] instances if the provided [LoginHandle] is valid, otherwise returns null.

  Future<Iterable<Note>?> getNotes({
    required LoginHandle loginHandle,
  });
}

/// A concrete implementation of the [NotesApiProtocol] representing notes API.

@immutable
class NotesApi implements NotesApiProtocol {
  /// Creates a [NotesApi] instance.
  const NotesApi();

  /// Retrieves notes based on the provided [LoginHandle].
  ///
  /// Simulates a delayed response with hardcoded login handle validation.

  @override
  Future<Iterable<Note>?> getNotes({
    required LoginHandle loginHandle,
  }) =>
      Future.delayed(
        const Duration(seconds: 2),
        () => loginHandle == const LoginHandle.fooBar() ? mockNotes : null,
      );
}
