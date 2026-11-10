class Profile {
  const Profile({
    required this.nama,
    required this.panggilan,
    required this.nim,
    required this.prodi,
    required this.kelas,
    required this.email,
    required this.hp,
    required this.github,
    required this.bio,
    required this.fotoAsset,
  });

  final String nama;
  final String panggilan;
  final String nim;
  final String prodi;
  final String kelas;
  final String email;
  final String hp;
  final String github;
  final String bio;
  final String fotoAsset;

  /// Data awal yang disimpan di memori (tanpa server/database).
  static const Profile initial = Profile(
    nama: 'Kenzie Gabriel',
    panggilan: 'Kenzie',
    nim: '1124160008',
    prodi: 'Teknik Informatika',
    kelas: 'TI SE-1',
    email: 'kenzigabriel3@gmail.com',
    hp: '081285853229',
    github: 'github.com/kenzifebri',
    bio:
        'Mahasiswa Teknik Informatika yang tertarik pada pengembangan aplikasi '
        'mobile dan web. Senang mempelajari hal baru, bekerja dalam tim, dan '
        'membangun aplikasi yang bermanfaat bagi banyak orang.',
    fotoAsset: 'assets/images/profile.png',
  );

  String get inisial {
    final List<String> bagian = nama
        .trim()
        .split(RegExp(r'\s+'))
        .where((String item) => item.isNotEmpty)
        .toList();
    if (bagian.isEmpty) return '?';
    if (bagian.length == 1) return bagian.first.substring(0, 1).toUpperCase();
    return (bagian.first.substring(0, 1) + bagian.last.substring(0, 1))
        .toUpperCase();
  }

  Profile copyWith({
    String? nama,
    String? panggilan,
    String? nim,
    String? prodi,
    String? kelas,
    String? email,
    String? hp,
    String? github,
    String? bio,
    String? fotoAsset,
  }) {
    return Profile(
      nama: nama ?? this.nama,
      panggilan: panggilan ?? this.panggilan,
      nim: nim ?? this.nim,
      prodi: prodi ?? this.prodi,
      kelas: kelas ?? this.kelas,
      email: email ?? this.email,
      hp: hp ?? this.hp,
      github: github ?? this.github,
      bio: bio ?? this.bio,
      fotoAsset: fotoAsset ?? this.fotoAsset,
    );
  }
}
