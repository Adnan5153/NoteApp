import 'package:flutter/material.dart';

import '../../models/note_model.dart';
import '../../views/notes/add_edit_note_screen.dart';
import '../../views/notes/notes_list_screen.dart';
import '../../views/splash/splash_screen.dart';

/// Centralized route table for the Notes app.
///
/// Keeping route names as string constants avoids typos when navigating.
class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String notesList = '/notes';
  static const String addEditNote = '/notes/edit';

  /// Centralized generator used by `MaterialApp.onGenerateRoute`.
  ///
  /// For [AppRoutes.addEditNote], pass the note being edited as the route
  /// argument, or `null` to enter add mode.
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );

      case notesList:
        return MaterialPageRoute(
          builder: (_) => const NotesListScreen(),
          settings: settings,
        );

      case addEditNote:
        final Note? note = settings.arguments as Note?;
        return MaterialPageRoute(
          builder: (_) => AddEditNoteScreen(note: note),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const NotesListScreen(),
          settings: settings,
        );
    }
  }
}
