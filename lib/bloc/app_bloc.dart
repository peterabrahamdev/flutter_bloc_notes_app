import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc_notes_app/apis/login_api.dart';
import 'package:flutter_bloc_notes_app/apis/notes_api.dart';
import 'package:flutter_bloc_notes_app/models.dart';
import 'package:flutter_bloc_notes_app/strings.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final LoginApiProtocol loginApi;
  final NotesApiProtocol notesApi;

  AppBloc({
    required this.loginApi,
    required this.notesApi,
  }) : super(const AppState.initial()) {
    on<LoginEvent>((event, emit) async {
      // start loading
      emit(
        const AppState(
          isLoading: true,
          fetchedNotes: null,
          loginError: null,
          loginHandle: null,
        ),
      );

      // log the user in
      final loginHandle = await loginApi.login(
        email: event.email,
        password: event.password,
      );

      emit(
        AppState(
          isLoading: true,
          fetchedNotes: null,
          loginError: loginHandle == null ? LoginErrors.invalidHandle : null,
          loginHandle: loginHandle,
        ),
      );
    });
    on<LoadNotesEvent>((event, emit) async {
      // start loading
      emit(
        AppState(
          isLoading: true,
          loginError: null,
          loginHandle: state.loginHandle,
          fetchedNotes: null,
        ),
      );
      // get login handle
      final loginHandle = state.loginHandle;

      if (loginHandle != const LoginHandle.fooBar()) {
        // invalid login handle, cannot fetch notes
        emit(
          AppState(
            isLoading: false,
            loginError: LoginErrors.invalidHandle,
            loginHandle: loginHandle,
            fetchedNotes: null,
          ),
        );
        return;
      }

      // we have a valid login handle and want to fetch notes
      final notes = await notesApi.getNotes(loginHandle: loginHandle!);
      emit(
        AppState(
          isLoading: false,
          loginError: null,
          loginHandle: loginHandle,
          fetchedNotes: notes,
        ),
      );
    });
  }
}
