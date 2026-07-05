import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference _notesCollection = 
      FirebaseFirestore.instance.collection('notes');

  // CREATE
  Future<void> addNote(String title, String description) {
    return _notesCollection.add({
      'title': title,
      'description': description,
    });
  }

  // READ (Stream for real-time updates)
  Stream<QuerySnapshot> getNotes() {
    return _notesCollection.snapshots();
  }

  // UPDATE
  Future<void> updateNote(String id, String title, String description) {
    return _notesCollection.doc(id).update({
      'title': title,
      'description': description,
    });
  }

  // DELETE
  Future<void> deleteNote(String id) {
    return _notesCollection.doc(id).delete();
  }
}