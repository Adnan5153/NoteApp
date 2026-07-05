import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_strings.dart';
import '../../core/routes/app_routes.dart';

/// Branded splash screen shown on app launch. After a short delay it
/// navigates to the notes list and is removed from the back stack.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _navigateTimer;

  @override
  void initState() {
    super.initState();
    _navigateTimer = Timer(const Duration(milliseconds: 1500), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed(AppRoutes.notesList);
    });
  }

  @override
  void dispose() {
    _navigateTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Pull colors from the active theme so the splash respects the
    // currently selected mode (light / dark) and follows whatever the
    // user picks later (system, light, or dark).
    final theme = Theme.of(context);
    final onPrimary = theme.colorScheme.onPrimary;

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.note_alt_outlined,
              size: AppDimensions.splashLogoSize,
              color: onPrimary,
            ),
            const SizedBox(height: AppDimensions.paddingMedium),
            Text(
              AppStrings.appTitle,
              style: TextStyle(
                color: onPrimary,
                fontSize: 32,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: AppDimensions.paddingSmall),
            Text(
              AppStrings.splashTagline,
              style: TextStyle(
                color: onPrimary,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: AppDimensions.paddingExtraLarge),
            SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                valueColor: AlwaysStoppedAnimation<Color>(onPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
