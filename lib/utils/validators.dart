import '../core/constants/app_strings.dart';

/// Form-level validation helpers. Each validator returns `null` when
/// the input is valid, or a human-readable error string otherwise.
class Validators {
  Validators._();

  /// Title must be present and within a reasonable length.
  static String? validateTitle(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.emptyTitleError;
    }
    if (value.trim().length > 100) {
      return 'Title must be 100 characters or less';
    }
    return null;
  }

  /// Description must be present and within a reasonable length.
  static String? validateDescription(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.emptyDescriptionError;
    }
    if (value.trim().length > 1000) {
      return 'Description must be 1000 characters or less';
    }
    return null;
  }
}
