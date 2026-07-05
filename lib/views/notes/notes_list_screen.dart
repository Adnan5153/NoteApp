// lib/views/notes/notes_list_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/notes_controller.dart';
import '../../core/constants/app_strings.dart';
import '../../core/routes/app_routes.dart';
import '../../core/widgets/empty_notes_widget.dart';
import '../../core/widgets/loading_widget.dart';
import '../../core/widgets/note_card.dart';
import '../../models/note_model.dart';

/// Home screen listing every note in the database with a FAB to add
/// a new one. Tapping a card opens it for editing.
///
/// This widget is pure UI: it reads [NotesController] via `provider`,
/// renders state, and forwards user intent back to the controller.
class NotesListScreen extends StatelessWidget {
  const NotesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.notesListTitle)),
      body: Consumer<NotesController>(
        builder: (context, controller, _) {
          if (controller.isLoading) {
            return const LoadingWidget(message: AppStrings.loading);
          }

          final error = controller.error;
          if (error != null && !controller.hasNotes) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  error.message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          }

          if (!controller.hasNotes) {
            return const EmptyNotesWidget();
          }

          final notes = controller.notes;
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final Note note = notes[index];
              return NoteCard(
                note: note,
                onTap: () => _openEdit(context, note),
                onDelete: () => _confirmDelete(context, controller, note),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.of(context).pushNamed(AppRoutes.addEditNote),
        tooltip: AppStrings.addNoteTooltip,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _openEdit(BuildContext context, Note note) {
    Navigator.of(context).pushNamed(
      AppRoutes.addEditNote,
      arguments: note,
    );
  }

  /// Shows a confirmation dialog and, on confirm, asks the controller
  /// to delete the note. No Firestore calls live here.
  Future<void> _confirmDelete(
    BuildContext context,
    NotesController controller,
    Note note,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text(AppStrings.confirmDeleteTitle),
          content: const Text(AppStrings.confirmDeleteMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: const Text(AppStrings.cancelButton),
            ),
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: const Text(
                AppStrings.deleteButton,
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      await controller.deleteNote(note.id);
    }
  }
}