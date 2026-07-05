/// Firestore collection and field names used by the Notes app.
///
/// Centralizing these constants avoids typos and makes it easy to refactor
/// the schema later without hunting through the codebase.
class FirestoreConstants {
  FirestoreConstants._();

  /// Name of the top-level collection that stores all notes.
  static const String notesCollection = 'notes';

  // Field names on each note document.
  static const String fieldId = 'id';
  static const String fieldTitle = 'title';
  static const String fieldDescription = 'description';
  static const String fieldCreatedAt = 'createdAt';
}
