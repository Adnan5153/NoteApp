import 'package:flutter/material.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_strings.dart';


class EmptyNotesWidget extends StatelessWidget {
  const EmptyNotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppDimensions.paddingLarge),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Placeholder for a "No Notes" Illustration or Icon
            Icon(
              Icons.note_add_outlined,
              size: 100,
              color: theme.colorScheme.primary,
            ),
            SizedBox(height: AppDimensions.paddingLarge),
            
            // Heading
            Text(
              AppStrings.noNotes,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            
            SizedBox(height: AppDimensions.paddingMedium),
            
            // Sub-headline (Optional if your text string is long enough)
            Text(
              "Your thoughts are waiting to be captured.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
            
            SizedBox(height: AppDimensions.paddingExtraLarge),
            
            // Action Button
            _buildCreateButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCreateButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigation logic to add a note would go here
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingLarge, vertical: AppDimensions.paddingSmall),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        ),
        elevation: 0,
      ),
      child: Text(
        AppStrings.createNote,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: AppDimensions.fontSizeLarge,
        ),
      ),
    );
  }
}
