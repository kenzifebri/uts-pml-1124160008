import 'package:flutter/material.dart';

import 'models/profile.dart';
import 'screens/login_page.dart';
import 'screens/profile_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const ProfilApp());
}

class ProfilApp extends StatelessWidget {
  const ProfilApp({super.key});

  Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/profile':
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const ProfilePage(profile: Profile.initial),
        );
      case '/':
      default:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const LoginPage(),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Kenzie',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      initialRoute: '/',
      onGenerateRoute: _onGenerateRoute,
    );
  }
}
