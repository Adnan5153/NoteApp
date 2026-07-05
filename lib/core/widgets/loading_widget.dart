import 'package:flutter/material.dart';
import '../constants/app_dimensions.dart';

class LoadingWidget extends StatelessWidget {
  final String? message;

  const LoadingWidget({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(
            // Uses the primary color defined in AppTheme (Light/Dark aware)
            color: theme.colorScheme.primary,
            // Stroke width adjustment for a cleaner look
            strokeWidth: 3.0,
          ),
          const SizedBox(height: AppDimensions.paddingMedium),
          if (message != null && message!.isNotEmpty)
            Text(
              message!,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
        ],
      ),
    );
  }
}
