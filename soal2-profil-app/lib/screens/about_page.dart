import 'package:flutter/material.dart';

import '../models/profile.dart';
import '../widgets/info_tile.dart';
import '../widgets/profile_avatar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key, required this.profile});

  final Profile profile;

  static const List<InfoTile> _keahlian = <InfoTile>[
    InfoTile(
      icon: Icons.phone_android_outlined,
      label: 'Mobile Development',
      value: 'Flutter, Dart, Material Design 3',
    ),
    InfoTile(
      icon: Icons.web_outlined,
      label: 'Web Development',
      value: 'HTML, CSS, JavaScript, PHP, Laravel',
    ),
    InfoTile(
      icon: Icons.storage_outlined,
      label: 'Database',
      value: 'MySQL, perancangan basis data relasional',
    ),
    InfoTile(
      icon: Icons.design_services_outlined,
      label: 'UI/UX Design',
      value: 'Figma, wireframe, dan prototyping',
    ),
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

  static const List<String> _pendidikan = <String>[
    'SMPN 1 Sepatan',
    'SMAN 11 Kab. Tangerang',
    'Kuliah di Global Institute Technology & Business',
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Saya')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          children: <Widget>[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: <Widget>[
                    ProfileAvatar(
                      asset: profile.fotoAsset,
                      inisial: profile.inisial,
                      radius: 32,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            profile.nama,
                            style: theme.textTheme.titleLarge,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '${profile.prodi} · ${profile.kelas}',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'NIM ${profile.nim}',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.auto_awesome_outlined,
                          color: theme.colorScheme.primary,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Tentang Saya',
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(profile.bio, style: theme.textTheme.bodyMedium),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            _Section(
              title: 'Keahlian',
              icon: Icons.workspace_premium_outlined,
              children: _keahlian,
            ),
            const SizedBox(height: 16),
            _Section(
              title: 'Hobi',
              icon: Icons.sports_esports_outlined,
              children: _hobi,
            ),
            const SizedBox(height: 16),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 18, 20, 8),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.history_edu_outlined,
                          color: theme.colorScheme.primary,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Riwayat Pendidikan',
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ..._pendidikan.map(
                    (String item) => ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 4,
                      ),
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: theme.colorScheme.secondaryContainer,
                        foregroundColor:
                            theme.colorScheme.onSecondaryContainer,
                        child: const Icon(Icons.school_outlined, size: 20),
                      ),
                      title: Text(
                        item,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Terima kasih telah membaca profil saya.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({
    required this.title,
    required this.icon,
    required this.children,
  });

  final String title;
  final IconData icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 4),
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
          ...children,
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
