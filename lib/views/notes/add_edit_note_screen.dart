import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_strings.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text_field.dart';
import '../../models/note_model.dart';
import '../../utils/validators.dart';
import '../../controllers/notes_controller.dart';

/// Form screen used for both adding a new note and editing an existing one.
///
/// Pass [note] as `null` to enter add mode; pass a [Note] to enter edit mode.
class AddEditNoteScreen extends StatefulWidget {
  final Note? note;

  const AddEditNoteScreen({super.key, this.note});

  bool get isEditing => note != null;

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note?.title ?? '');
    _descriptionController =
        TextEditingController(text: widget.note?.description ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);

    final controller = context.read<NotesController>();
    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();

    try {
      if (widget.isEditing) {
        await controller.updateNote(
          id: widget.note!.id,
          title: title,
          description: description,
        );
      } else {
        await controller.addNote(title: title, description: description);
      }
      if (!mounted) return;
      Navigator.of(context).pop();
    } catch (e) {
      if (!mounted) return;
      final err = controller.error;
      final msg = err is NotesPermissionError
          ? 'Permission denied — check your Firestore rules.'
          : '${AppStrings.genericError}: $e';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(msg)),
      );
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isEditing ? AppStrings.editNoteTitle : AppStrings.addNoteTitle,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppDimensions.paddingMedium),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(
                  controller: _titleController,
                  label: AppStrings.titleLabel,
                  hint: AppStrings.titleHint,
                  validator: Validators.validateTitle,
                  maxLength: 100,
                ),
                CustomTextField(
                  controller: _descriptionController,
                  label: AppStrings.descriptionLabel,
                  hint: AppStrings.descriptionHint,
                  validator: Validators.validateDescription,
                  maxLines: 6,
                  maxLength: 1000,
                  keyboardType: TextInputType.multiline,
                ),
                const SizedBox(height: AppDimensions.paddingLarge),
                CustomButton(
                  label: AppStrings.saveButton,
                  onPressed: _save,
                  isLoading: _isSaving,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
