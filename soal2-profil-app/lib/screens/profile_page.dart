import 'package:flutter/material.dart';

import '../models/profile.dart';
import '../widgets/info_tile.dart';
import '../widgets/profile_avatar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
    required this.profile,
    required this.onProfileUpdated,
  });

  final Profile profile;
  final ValueChanged<Profile> onProfileUpdated;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Profile _profile;

  @override
  void initState() {
    super.initState();
    _profile = widget.profile;
  }

  @override
  void didUpdateWidget(covariant ProfilePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.profile != widget.profile) {
      _profile = widget.profile;
    }
  }

  Future<void> _bukaEditProfil() async {
    final Object? hasil = await Navigator.of(
      context,
    ).pushNamed('/edit', arguments: _profile);

    if (!mounted || hasil is! Profile) return;

    // Data baru dari Navigator.pop langsung ditampilkan dengan setState().
    setState(() => _profile = hasil);
    widget.onProfileUpdated(hasil);

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(content: Text('Profil berhasil diperbarui')),
      );
  }

  void _bukaTentang() {
    Navigator.of(context).pushNamed('/about', arguments: _profile);
  }

  void _keluar() {
    Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> r) {
      return false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        actions: <Widget>[
          IconButton(
            tooltip: 'Tentang saya',
            onPressed: _bukaTentang,
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      drawer: _AppDrawer(
        profile: _profile,
        onEdit: () {
          Navigator.of(context).pop();
          _bukaEditProfil();
        },
        onAbout: () {
          Navigator.of(context).pop();
          _bukaTentang();
        },
        onLogout: _keluar,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _bukaEditProfil,
        icon: const Icon(Icons.edit_outlined),
        label: const Text('Edit Profil'),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (int index) {
          if (index == 1) {
            _bukaEditProfil();
          } else if (index == 2) {
            _bukaTentang();
          }
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profil',
          ),
          NavigationDestination(
            icon: Icon(Icons.edit_outlined),
            label: 'Edit',
          ),
          NavigationDestination(
            icon: Icon(Icons.info_outline),
            label: 'Tentang',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 110),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _ProfileHeader(profile: _profile),
                  const SizedBox(height: 16),
                  _SectionCard(
                    title: 'Kontak',
                    icon: Icons.contact_phone_outlined,
                    children: <Widget>[
                      InfoTile(
                        icon: Icons.email_outlined,
                        label: 'Email',
                        value: _profile.email,
                      ),
                      InfoTile(
                        icon: Icons.phone_outlined,
                        label: 'Nomor HP',
                        value: _profile.hp,
                      ),
                      InfoTile(
                        icon: Icons.code_outlined,
                        label: 'GitHub',
                        value: _profile.github,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _SectionCard(
                    title: 'Data Akademik',
                    icon: Icons.school_outlined,
                    children: <Widget>[
                      InfoTile(
                        icon: Icons.pin_outlined,
                        label: 'NIM',
                        value: _profile.nim,
                      ),
                      InfoTile(
                        icon: Icons.menu_book_outlined,
                        label: 'Program Studi',
                        value: _profile.prodi,
                      ),
                      InfoTile(
                        icon: Icons.groups_outlined,
                        label: 'Kelas',
                        value: _profile.kelas,
                      ),
                    ],
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
                                Icons.article_outlined,
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
                          Text(
                            _profile.bio,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
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
  const _ProfileHeader({required this.profile});

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme scheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            scheme.primary,
            Color.lerp(scheme.primary, scheme.tertiary, 0.55)!,
          ],
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: scheme.primary.withValues(alpha: 0.25),
            blurRadius: 26,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: scheme.onPrimary, width: 3),
            ),
            child: ProfileAvatar(
              asset: profile.fotoAsset,
              inisial: profile.inisial,
              radius: 48,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            profile.nama,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: scheme.onPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '@${profile.panggilan.toLowerCase()}',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: scheme.onPrimary.withValues(alpha: 0.8),
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              _HeaderChip(icon: Icons.pin_outlined, label: profile.nim),
              _HeaderChip(icon: Icons.school_outlined, label: profile.prodi),
              _HeaderChip(icon: Icons.groups_outlined, label: profile.kelas),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeaderChip extends StatelessWidget {
  const _HeaderChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: scheme.onPrimary.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: scheme.onPrimary.withValues(alpha: 0.25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, size: 15, color: scheme.onPrimary),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: scheme.onPrimary,
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
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

class _AppDrawer extends StatelessWidget {
  const _AppDrawer({
    required this.profile,
    required this.onEdit,
    required this.onAbout,
    required this.onLogout,
  });

  final Profile profile;
  final VoidCallback onEdit;
  final VoidCallback onAbout;
  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            margin: EdgeInsets.zero,
            currentAccountPicture: ProfileAvatar(
              asset: profile.fotoAsset,
              inisial: profile.inisial,
              radius: 36,
            ),
            accountName: Text(
              profile.nama,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            accountEmail: Text(profile.email),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  theme.colorScheme.primary,
                  theme.colorScheme.tertiary,
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Profil'),
            trailing: const Icon(Icons.check, size: 18),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            leading: const Icon(Icons.edit_outlined),
            title: const Text('Edit Profil'),
            onTap: onEdit,
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Tentang Saya'),
            onTap: onAbout,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Keluar'),
            onTap: onLogout,
          ),
        ],
      ),
    );
  }
}
