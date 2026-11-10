import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/profile.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key, required this.profile});

  final Profile profile;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final TextEditingController _namaController;
  late final TextEditingController _panggilanController;
  late final TextEditingController _nimController;
  late final TextEditingController _prodiController;
  late final TextEditingController _kelasController;
  late final TextEditingController _emailController;
  late final TextEditingController _hpController;
  late final TextEditingController _bioController;

  @override
  void initState() {
    super.initState();
    final Profile profile = widget.profile;
    _namaController = TextEditingController(text: profile.nama);
    _panggilanController = TextEditingController(text: profile.panggilan);
    _nimController = TextEditingController(text: profile.nim);
    _prodiController = TextEditingController(text: profile.prodi);
    _kelasController = TextEditingController(text: profile.kelas);
    _emailController = TextEditingController(text: profile.email);
    _hpController = TextEditingController(text: profile.hp);
    _bioController = TextEditingController(text: profile.bio);
  }

  @override
  void dispose() {
    _namaController.dispose();
    _panggilanController.dispose();
    _nimController.dispose();
    _prodiController.dispose();
    _kelasController.dispose();
    _emailController.dispose();
    _hpController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  String? _wajibDiisi(String? value, String label) {
    if (value == null || value.trim().isEmpty) {
      return '$label wajib diisi';
    }
    return null;
  }

  String? _validasiEmail(String? value) {
    final String email = value?.trim() ?? '';
    if (email.isEmpty) {
      return 'Email wajib diisi';
    }
    final RegExp pattern = RegExp(r'^[\w.+-]+@[\w-]+\.[\w.-]+$');
    if (!pattern.hasMatch(email)) {
      return 'Format email tidak valid';
    }
    return null;
  }

  String? _validasiHp(String? value) {
    final String hp = value?.trim() ?? '';
    if (hp.isEmpty) {
      return 'Nomor HP wajib diisi';
    }
    if (!RegExp(r'^\d{10,13}$').hasMatch(hp)) {
      return 'Nomor HP harus berupa 10-13 digit angka';
    }
    return null;
  }

  void _simpan() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final Profile dataBaru = widget.profile.copyWith(
      nama: _namaController.text.trim(),
      panggilan: _panggilanController.text.trim(),
      nim: _nimController.text.trim(),
      prodi: _prodiController.text.trim(),
      kelas: _kelasController.text.trim(),
      email: _emailController.text.trim(),
      hp: _hpController.text.trim(),
      bio: _bioController.text.trim(),
    );

    // Data baru dikirim kembali ke halaman profil melalui Navigator.pop.
    Navigator.of(context).pop(dataBaru);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
        leading: IconButton(
          tooltip: 'Batal',
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.close),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 640),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Perbarui data profil',
                      style: theme.textTheme.titleLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Perubahan akan langsung tampil di halaman profil.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 18),
                    _FormSection(
                      title: 'Data Pribadi',
                      children: <Widget>[
                        TextFormField(
                          controller: _namaController,
                          textCapitalization: TextCapitalization.words,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            labelText: 'Nama Lengkap',
                            prefixIcon: Icon(Icons.badge_outlined),
                          ),
                          validator: (String? value) =>
                              _wajibDiisi(value, 'Nama'),
                        ),
                        const SizedBox(height: 14),
                        TextFormField(
                          controller: _panggilanController,
                          textCapitalization: TextCapitalization.words,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            labelText: 'Nama Panggilan',
                            prefixIcon: Icon(Icons.face_outlined),
                          ),
                          validator: (String? value) =>
                              _wajibDiisi(value, 'Nama panggilan'),
                        ),
                        const SizedBox(height: 14),
                        TextFormField(
                          controller: _bioController,
                          maxLines: 3,
                          maxLength: 240,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: const InputDecoration(
                            labelText: 'Bio Singkat',
                            alignLabelWithHint: true,
                            prefixIcon: Icon(Icons.notes_outlined),
                          ),
                          validator: (String? value) =>
                              _wajibDiisi(value, 'Bio'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _FormSection(
                      title: 'Data Akademik',
                      children: <Widget>[
                        TextFormField(
                          controller: _nimController,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: const InputDecoration(
                            labelText: 'NIM',
                            prefixIcon: Icon(Icons.pin_outlined),
                          ),
                          validator: (String? value) =>
                              _wajibDiisi(value, 'NIM'),
                        ),
                        const SizedBox(height: 14),
                        TextFormField(
                          controller: _prodiController,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            labelText: 'Program Studi',
                            prefixIcon: Icon(Icons.school_outlined),
                          ),
                          validator: (String? value) =>
                              _wajibDiisi(value, 'Program studi'),
                        ),
                        const SizedBox(height: 14),
                        TextFormField(
                          controller: _kelasController,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            labelText: 'Kelas',
                            prefixIcon: Icon(Icons.groups_outlined),
                          ),
                          validator: (String? value) =>
                              _wajibDiisi(value, 'Kelas'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _FormSection(
                      title: 'Kontak',
                      children: <Widget>[
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email_outlined),
                          ),
                          validator: _validasiEmail,
                        ),
                        const SizedBox(height: 14),
                        TextFormField(
                          controller: _hpController,
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.done,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(13),
                          ],
                          decoration: const InputDecoration(
                            labelText: 'Nomor HP',
                            helperText: 'Hanya angka, 10-13 digit',
                            prefixIcon: Icon(Icons.phone_outlined),
                          ),
                          validator: _validasiHp,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    FilledButton.icon(
                      onPressed: _simpan,
                      icon: const Icon(Icons.save_outlined),
                      label: const Text('Simpan Perubahan'),
                    ),
                    const SizedBox(height: 10),
                    OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Batal'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FormSection extends StatelessWidget {
  const _FormSection({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 14),
            ...children,
          ],
        ),
      ),
    );
  }
}
