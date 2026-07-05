class AppStrings {
  // App
  static const String appTitle = 'Notes';

  // Splash
  static const String splashTagline = 'Your thoughts, organized.';

  // Notes list
  static const String notesListTitle = 'My Notes';
  static const String addNoteTooltip = 'Add note';
  static const String loading = 'Loading…';

  // Add / Edit
  static const String addNoteTitle = 'Add Note';
  static const String editNoteTitle = 'Edit Note';
  static const String titleLabel = 'Title';
  static const String titleHint = 'Enter note title';
  static const String descriptionLabel = 'Description';
  static const String descriptionHint = 'Enter note description';

  // Buttons
  static const String saveButton = 'Save';
  static const String cancelButton = 'Cancel';
  static const String deleteButton = 'Delete';

  // Dialogs
  static const String confirmDeleteTitle = 'Delete note?';
  static const String confirmDeleteMessage =
      'This action cannot be undone.';

  // Authentication
  static const String login = "Login";
  static const String signup = "Sign Up";
  static const String welcomeBack = "Welcome Back";
  static const String forgotPassword = "Forgot Password?";
  static const String emailHint = "Enter your email";
  static const String passwordHint = "Enter your password";
  static const String loginSuccess = "Login successful!";
  static const String signupSuccess = "Account created successfully!";

  // Notes Management
  static const String createNote = "Create New Note";
  static const String editNote = "Edit Note";
  static const String noteTitleHint = "Enter title";
  static const String noteContentHint = "Start writing your thoughts...";
  static const String deleteNote = "Delete Note";
  static const String confirmDelete =
      "Are you sure you want to delete this note?";
  static const String searchPlaceholder = "Search notes...";
  static const String favoriteLabel = "Favorite";
  static const String category = "Category";

  // Validation errors (used by Validators and forms)
  static const String emptyTitleError = 'Title cannot be empty';
  static const String emptyDescriptionError = 'Description cannot be empty';

  // Folders/Categories
  static const String personal = "Personal";
  static const String work = "Work";
  static const String ideas = "Ideas";
  static const String shopping = "Shopping";
  static const String school = "School";

  // Status & Errors
  static const String noNotes =
      "No notes found. Start by creating your first one!";
  static const String networkError =
      "Network error. Please check your connection.";
  static const String updateSuccess = "Note updated successfully.";
  static const String syncSuccess = "Synced with cloud";
  static const String genericError = 'Something went wrong. Please try again.';

  // Placeholders
  static const String placeholderGeneral = "Type something...";

  // Routes
  static const String routeSplash = "/splash";
  static const String routeNotes = "/notes";
  static const String routeAddNote = "/add-note";
  static const String routeEditNote = "/edit-note";
}
