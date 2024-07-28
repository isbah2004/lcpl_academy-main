import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lcpl_academy/screens/splash_screen.dart';
import 'package:lcpl_academy/theme/theme.dart';
import 'firebase_options.dart';

// ...
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    home: const SplashScreen(),
    theme: AppTheme.lightTheme,
  ));
}
