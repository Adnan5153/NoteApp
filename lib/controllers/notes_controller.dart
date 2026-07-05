import 'dart:async';

import 'package:flutter/foundation.dart';

import '../models/note_model.dart';
import '../repositories/note_repository.dart';

/// Typed UI errors so screens can branch on the cause instead of always
/// rendering a generic message.
sealed class NotesError {
  const NotesError(this.message);
  final String message;
}

class NotesGenericError extends NotesError {
  const NotesGenericError([super.message = 'Something went wrong']);
}

class NotesPermissionError extends NotesError {
  const NotesPermissionError()
      : super('You do not have permission to perform this action');
}

/// UI contract for the Notes screens. The views NEVER touch the
/// repository or the data source directly — only this controller.
class NotesController extends ChangeNotifier {
  NotesController({NoteRepository? repository})
      : _repository = repository ?? NoteRepository() {
    _subscribe();
  }

  final NoteRepository _repository;
  StreamSubscription<List<Note>>? _subscription;

  // --- Internal state ---
  List<Note> _notes = const <Note>[];
  bool _isLoading = true;
  NotesError? _error;

  // --- Read-only state surfaced to the UI ---
  List<Note> get notes => List.unmodifiable(_notes);
  bool get isLoading => _isLoading;
  NotesError? get error => _error;
  bool get hasNotes => _notes.isNotEmpty;

  void clearError() {
    if (_error == null) return;
    _error = null;
    notifyListeners();
  }

  // --- Stream subscription ---
  void _subscribe() {
    _subscription = _repository.watchNotes().listen(
          (incoming) {
        _notes = incoming;
        _isLoading = false;
        _error = null;
        notifyListeners();
      },
      onError: (Object e, StackTrace _) {
        _isLoading = false;
        _error = _mapError(e);
        notifyListeners();
      },
    );
  }

  NotesError _mapError(Object e) {
    final raw = e.toString();
    if (raw.contains('permission-denied') ||
        raw.contains('PERMISSION_DENIED')) {
      return const NotesPermissionError();
    }
    return NotesGenericError(raw);
  }

  // --- Mutations exposed to the UI ---
  Future<void> addNote({required String title, required String description}) =>
      _run(() => _repository.addNote(title: title, description: description));

  Future<void> updateNote({
    required String id,
    required String title,
    required String description,
  }) =>
      _run(() => _repository.updateNote(id: id, title: title, description: description));

  Future<void> deleteNote(String id) =>
      _run(() => _repository.deleteNote(id));

  Future<void> _run(Future<void> Function() action) async {
    try {
      await action();
    } catch (e) {
      _error = _mapError(e);
      notifyListeners();
      rethrow;
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
