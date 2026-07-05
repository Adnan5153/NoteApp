import 'package:cloud_firestore/cloud_firestore.dart';

import '../core/constants/firestore_constants.dart';

/// Immutable representation of a single note stored in Cloud Firestore.
class Note {
  /// Firestore document ID. Empty string for unsaved notes.
  final String id;

  /// Note headline shown on the list card.
  final String title;

  /// Note body shown beneath the title.
  final String description;

  /// Server-side timestamp set when the note was first created.
  final DateTime? createdAt;

  const Note({
    required this.id,
    required this.title,
    required this.description,
    this.createdAt,
  });

  /// Convenience constructor used when creating a brand-new note that has
  /// not yet been persisted (no ID, no server timestamp).
  factory Note.create({required String title, required String description}) {
    return Note(id: '', title: title, description: description);
  }

  /// Builds a [Note] from a Firestore document snapshot. Accepts either
  /// a `DocumentSnapshot` or a `QueryDocumentSnapshot` so the same
  /// factory works in both single-doc and collection contexts.
  factory Note.fromFirestore(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    final raw = data[FirestoreConstants.fieldCreatedAt];
    DateTime? createdAt;
    if (raw is Timestamp) {
      createdAt = raw.toDate();
    } else if (raw is DateTime) {
      createdAt = raw;
    }
    return Note(
      id: doc.id,
      title: (data[FirestoreConstants.fieldTitle] as String?) ?? '',
      description:
          (data[FirestoreConstants.fieldDescription] as String?) ?? '',
      createdAt: createdAt,
    );
  }

  /// Serializes the note to the map shape persisted in Firestore.
  /// Excludes the document [id] since that lives on the document itself.
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      FirestoreConstants.fieldTitle: title,
      FirestoreConstants.fieldDescription: description,
      FirestoreConstants.fieldCreatedAt:
          createdAt != null ? Timestamp.fromDate(createdAt!) : FieldValue.serverTimestamp(),
    };
  }

  /// Returns a copy of this note with the given fields replaced.
  Note copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? createdAt,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() =>
      'Note(id: $id, title: $title, description: $description, createdAt: $createdAt)';
}
