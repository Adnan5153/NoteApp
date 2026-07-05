import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../core/constants/firestore_constants.dart';
import '../models/note_model.dart';
import '../services/firestore_service.dart';

/// Thin abstraction over the raw Firestore service. Screens and viewmodels
/// depend on this rather than `DatabaseService` directly so they can be
/// unit-tested by swapping in a fake.
class NoteRepository {
  NoteRepository({DatabaseService? service})
      : _service = service ?? DatabaseService();

  final DatabaseService _service;

  /// Real-time stream of notes ordered by creation time (newest first).
  /// Maps each [QuerySnapshot] into a [List<Note>] for easier consumption.
  Stream<List<Note>> watchNotes() {
    return _service.getNotes().map((QuerySnapshot snapshot) {
      final docs = snapshot.docs;
      final notes = <Note>[];
      for (final QueryDocumentSnapshot<Object?> doc in docs) {
        // Cast the raw document data to the typed map Note expects.
        final Map<String, dynamic> data =
            (doc.data() as Map?)?.cast<String, dynamic>() ?? <String, dynamic>{};
        notes.add(Note(
          id: doc.id,
          title: (data[FirestoreConstants.fieldTitle] as String?) ?? '',
          description:
              (data[FirestoreConstants.fieldDescription] as String?) ?? '',
          createdAt: data[FirestoreConstants.fieldCreatedAt] is Timestamp
              ? (data[FirestoreConstants.fieldCreatedAt] as Timestamp).toDate()
              : null,
        ));
      }
      notes.sort((a, b) {
        final aTs = a.createdAt;
        final bTs = b.createdAt;
        if (aTs == null && bTs == null) return 0;
        if (aTs == null) return 1;
        if (bTs == null) return -1;
        return bTs.compareTo(aTs);
      });
      return notes;
    });
  }

  /// Persists a new note with the given title and description.
  Future<void> addNote({required String title, required String description}) {
    return _service.addNote(title, description);
  }

  /// Updates an existing note identified by [id].
  Future<void> updateNote({
    required String id,
    required String title,
    required String description,
  }) {
    return _service.updateNote(id, title, description);
  }

  /// Deletes a note by its document ID.
  Future<void> deleteNote(String id) {
    return _service.deleteNote(id);
  }
}
