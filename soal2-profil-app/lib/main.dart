import 'package:flutter/material.dart';

import 'models/profile.dart';
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
  Profile _profile = Profile.initial;

  void _perbaruiProfil(Profile profile) {
    setState(() => _profile = profile);
  }

  Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/profile':
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => ProfilePage(
            profile: _profile,
            onProfileUpdated: _perbaruiProfil,
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
