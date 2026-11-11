import 'package:flutter/material.dart';

import 'models/profile.dart';
import 'screens/about_page.dart';
import 'screens/edit_profile_page.dart';
import 'screens/login_page.dart';
import 'screens/profile_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const ProfilApp());
}

class ProfilApp extends StatefulWidget {
  const ProfilApp({super.key});

  @override
  State<ProfilApp> createState() => _ProfilAppState();
}

class _ProfilAppState extends State<ProfilApp> {
  ThemeMode _themeMode = ThemeMode.system;
  Profile _profile = Profile.initial;

  void _ubahThemeMode(ThemeMode mode) {
    setState(() => _themeMode = mode);
  }

  void _perbaruiProfil(Profile profile) {
    setState(() => _profile = profile);
  }

  Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const LoginPage(),
        );
      case '/profile':
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => ProfilePage(
            profile: _profile,
            onProfileUpdated: _perbaruiProfil,
            onThemeModeChanged: _ubahThemeMode,
          ),
        );
      case '/edit':
        final Profile profilEdit = settings.arguments is Profile
            ? settings.arguments! as Profile
            : _profile;
        return MaterialPageRoute<Profile>(
          settings: settings,
          builder: (_) => EditProfilePage(profile: profilEdit),
        );
      case '/about':
        final Profile profilTentang = settings.arguments is Profile
            ? settings.arguments! as Profile
            : _profile;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => AboutPage(profile: profilTentang),
        );
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
      themeMode: _themeMode,
      initialRoute: '/',
      onGenerateRoute: _onGenerateRoute,
    );
  }
}
