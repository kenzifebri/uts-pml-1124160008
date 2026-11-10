import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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

  String? _validasiPassword(String? value) {
    final String password = value ?? '';
    if (password.isEmpty) {
      return 'Password wajib diisi';
    }
    if (password.length < 6) {
      return 'Password minimal 6 karakter';
    }
    return null;
  }

  Future<void> _masuk() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    FocusScope.of(context).unfocus();
    setState(() => _isLoading = true);

    // Simulasi proses asynchronous (mis. request ke server).
    await Future<void>.delayed(const Duration(milliseconds: 900));

    if (!mounted) return;
    setState(() => _isLoading = false);
    Navigator.of(context).pushReplacementNamed('/profile');
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              theme.colorScheme.primaryContainer,
              theme.colorScheme.surface,
              isDark
                  ? theme.colorScheme.surfaceContainerHighest
                  : const Color(0xFFE8F3F0),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 430),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Center(
                      child: Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(22),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: theme.colorScheme.primary.withValues(
                                alpha: 0.3,
                              ),
                              blurRadius: 24,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.person_search_outlined,
                          size: 38,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'Profil Mahasiswa',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Masuk untuk melihat profil dan data akademik.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(
                                'Selamat datang',
                                style: theme.textTheme.titleLarge,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Silakan masuk dengan akun kampus Anda.',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                autofillHints: const <String>[
                                  AutofillHints.email,
                                ],
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                  hintText: 'nama@email.com',
                                  prefixIcon: Icon(Icons.email_outlined),
                                ),
                                validator: _validasiEmail,
                              ),
                              const SizedBox(height: 14),
                              TextFormField(
                                controller: _passwordController,
                                obscureText: _obscurePassword,
                                textInputAction: TextInputAction.done,
                                onFieldSubmitted: (_) => _masuk(),
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  hintText: 'Minimal 6 karakter',
                                  prefixIcon: const Icon(Icons.lock_outline),
                                  suffixIcon: IconButton(
                                    tooltip: _obscurePassword
                                        ? 'Tampilkan password'
                                        : 'Sembunyikan password',
                                    onPressed: () {
                                      setState(
                                        () => _obscurePassword =
                                            !_obscurePassword,
                                      );
                                    },
                                    icon: Icon(
                                      _obscurePassword
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                    ),
                                  ),
                                ),
                                validator: _validasiPassword,
                              ),
                              const SizedBox(height: 22),
                              FilledButton.icon(
                                onPressed: _isLoading ? null : _masuk,
                                icon: _isLoading
                                    ? const SizedBox(
                                        width: 18,
                                        height: 18,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ),
                                      )
                                    : const Icon(Icons.login),
                                label: Text(
                                  _isLoading ? 'Memproses...' : 'Masuk',
                                ),
                              ),
                              const SizedBox(height: 14),
                              Text(
                                'Demo: gunakan email Anda dan password '
                                'minimal 6 karakter.',
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'UTS Aplikasi Mobile · Flutter',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
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
