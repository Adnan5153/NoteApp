import 'package:flutter/material.dart';
import '../constants/app_dimensions.dart';

enum ButtonType { primary, outline }

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final ButtonType type;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    // Accessing theme data to ensure colors adapt to light/dark mode automatically
    final theme = Theme.of(context);
    final isPrimary = type == ButtonType.primary;

    return SizedBox(
      width: double
          .infinity, // Standard for many mobile buttons, or wrap in a container with specific width
      height: AppDimensions.buttonHeight,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary
              ? theme.colorScheme.primary
              : Colors.transparent,
          foregroundColor: isPrimary
              ? theme.colorScheme.onPrimary
              : theme.colorScheme.primary,
          elevation: isPrimary ? 0 : 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
            side: isPrimary
                ? BorderSide.none
                : BorderSide(color: theme.colorScheme.primary, width: 1.5),
          ),
        ),
        child: isLoading
            ? SizedBox(
                height: AppDimensions.buttonHeight,
                width: AppDimensions.buttonHeight,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: isPrimary
                      ? theme.colorScheme.onPrimary
                      : theme.colorScheme.primary,
                ),
              )
            : Text(
                label,
                style: TextStyle(
                  fontSize: AppDimensions.fontSizeMedium,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
