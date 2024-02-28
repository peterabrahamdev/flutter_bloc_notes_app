import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_notes_app/apis/login_api.dart';
import 'package:flutter_bloc_notes_app/apis/notes_api.dart';
import 'package:flutter_bloc_notes_app/bloc/app_bloc.dart';
import 'package:flutter_bloc_notes_app/dialogs/generic_dialog.dart';
import 'package:flutter_bloc_notes_app/dialogs/loading_screen.dart';
import 'package:flutter_bloc_notes_app/models.dart';
import 'package:flutter_bloc_notes_app/screens/iterable_list_screen.dart';
import 'package:flutter_bloc_notes_app/screens/login_screen.dart';
import 'package:flutter_bloc_notes_app/strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(
        loginApi: LoginApi(),
        notesApi: const NotesApi(),
      ),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text(homePage),
          ),
          body: BlocConsumer<AppBloc, AppState>(
            listener: (context, state) {
              // loading screen
              if (state.isLoading) {
                LoadingScreen.instance().show(
                  context: context,
                  text: pleaseWait,
                );
              } else {
                LoadingScreen.instance().hide();
              }
              // display possible errors
              if (state.loginError != null) {
                showGenericDialog<bool>(
                  context: context,
                  title: loginErrorDialogTitle,
                  content: loginErrorDialogContent,
                  optionsBuilder: () => {ok: true},
                );
              }
              // if we are logged in, but we have no fetched notes, fetch them now
              if (state.isLoading == false &&
                  state.loginError == null &&
                  state.loginHandle == const LoginHandle.fooBar() &&
                  state.fetchedNotes == null) {
                context.read<AppBloc>().add(const LoadNotesEvent());
              }
            },
            builder: (context, state) {
              final notes = state.fetchedNotes;
              if (notes == null) {
                return LoginScreen(
                  onLoginTapped: (email, password) {
                    context.read<AppBloc>().add(
                          LoginEvent(email: email, password: password),
                        );
                  },
                );
              } else {
                return notes.toListView();
              }
            },
          ),
        ),
      ),
    );
  }
}
