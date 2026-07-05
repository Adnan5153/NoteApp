import 'package:flutter/material.dart';
import '../constants/app_dimensions.dart';

/// A reusable themed text field used across forms (e.g., the Add/Edit
/// Note screen). Wraps [TextFormField] so it can plug into [Form]
/// validation directly via the `validator` callback.
class CustomTextField extends StatelessWidget {
  /// Controller bound to the field's text.
  final TextEditingController controller;

  /// Field label rendered above the input.
  final String label;

  /// Placeholder text rendered inside the input when empty.
  final String? hint;

  /// Optional validation callback returning an error string or null.
  final FormFieldValidator<String>? validator;

  /// Enables multi-line input for the description field.
  final int maxLines;

  /// Caps the total characters allowed. Defaults to no limit.
  final int? maxLength;

  /// Keyboard type to use (text, multiline, etc.).
  final TextInputType keyboardType;

  /// Triggered whenever the field's text changes.
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.hint,
    this.validator,
    this.maxLines = 1,
    this.maxLength,
    this.keyboardType = TextInputType.text,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimensions.paddingMedium),
      child: TextFormField(
        controller: controller,
        validator: validator,
        maxLines: maxLines,
        maxLength: maxLength,
        keyboardType: keyboardType,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
        ),
      ),
    );
  }
}