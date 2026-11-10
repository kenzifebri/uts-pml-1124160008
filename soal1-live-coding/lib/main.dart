import 'package:flutter/material.dart';

/// ============================================================
/// SOAL 1 - LIVE CODING
/// Halaman Profil Mahasiswa
/// Seluruh widget pada file ini adalah StatelessWidget.
/// ============================================================

const String namaLengkap = 'Kenzie Gabriel';
const String nim = '1124160008';
const String programStudi = 'Teknik Informatika';
const String kelas = 'TI SE-1';
const String email = 'kenzigabriel3@gmail.com';
const String nomorHp = '081285853229';
const String akunGithub = 'github.com/kenzifebri';
const String inisial = 'KG';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil $namaLengkap',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(Brightness.light),
      darkTheme: _buildTheme(Brightness.dark),
      themeMode: ThemeMode.system,
      home: const ProfilePage(),
    );
  }

  ThemeData _buildTheme(Brightness brightness) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF0F766E),
        brightness: brightness,
      ),
      appBarTheme: const AppBarTheme(centerTitle: true),
      textTheme: const TextTheme(
        headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        bodyMedium: TextStyle(fontSize: 14, height: 1.45),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const List<InfoTile> _kontak = <InfoTile>[
    InfoTile(icon: Icons.email_outlined, label: 'Email', value: email),
    InfoTile(icon: Icons.phone_outlined, label: 'Nomor HP', value: nomorHp),
    InfoTile(icon: Icons.groups_outlined, label: 'Kelas', value: kelas),
    InfoTile(icon: Icons.code_outlined, label: 'GitHub', value: akunGithub),
  ];

  static const List<InfoTile> _hobi = <InfoTile>[
    InfoTile(
      icon: Icons.sports_tennis_outlined,
      label: 'Badminton',
      value: 'Bermain badminton untuk menjaga kebugaran',
    ),
    InfoTile(
      icon: Icons.piano_outlined,
      label: 'Piano',
      value: 'Bermain musik piano di waktu luang',
    ),
    InfoTile(
      icon: Icons.storefront_outlined,
      label: 'Bisnis',
      value: 'Mencoba dan mempelajari berbagai peluang bisnis',
    ),
  ];

  void _tampilkanPesan(BuildContext context, String pesan) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(pesan)));
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _tampilkanPesan(
          context,
          'Terima kasih telah melihat profil saya',
        ),
        icon: const Icon(Icons.favorite_outline),
        label: const Text('Terima Kasih'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 96),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _ProfileHeader(theme: theme),
                  const SizedBox(height: 20),
                  _InfoCard(
                    title: 'Kontak',
                    icon: Icons.contact_phone_outlined,
                    items: _kontak,
                  ),
                  const SizedBox(height: 16),
                  _InfoCard(
                    title: 'Hobi',
                    icon: Icons.sports_esports_outlined,
                    items: _hobi,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: theme.colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 44,
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: theme.colorScheme.onPrimary,
              child: Text(
                inisial,
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: theme.colorScheme.onPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              namaLengkap,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineSmall?.copyWith(
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              nim,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onPrimaryContainer,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              programStudi,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 14),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: <Widget>[
                Chip(
                  avatar: const Icon(Icons.badge_outlined, size: 18),
                  label: const Text('Mahasiswa Aktif'),
                  visualDensity: VisualDensity.compact,
                ),
                Chip(
                  avatar: const Icon(Icons.class_outlined, size: 18),
                  label: const Text(kelas),
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.title,
    required this.icon,
    required this.items,
  });

  final String title;
  final IconData icon;
  final List<InfoTile> items;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: theme.colorScheme.outlineVariant),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 6),
            child: Row(
              children: <Widget>[
                Icon(icon, color: theme.colorScheme.primary),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          ...items,
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

/// Widget reusable yang dipakai pada Card Kontak dan Hobi.
class InfoTile extends StatelessWidget {
  const InfoTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      subtitle: Text(value),
      dense: true,
    );
  }
}
