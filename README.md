# UTS Aplikasi Mobile — Aplikasi Profil Mahasiswa

**Kenzie Gabriel** · NIM **1124160008** · Kelas **TI SE-1**  
Program Studi Teknik Informatika  
Institut Teknologi & Bisnis Bina Sarana Global

## Tautan

- **Repository:** <https://github.com/kenzifebri/uts-pml-1124160008>
- **APK v1.0.0:** <https://github.com/kenzifebri/uts-pml-1124160008/releases/tag/v1.0.0>
- **Video presentasi:** [`ISI_LINK_YOUTUBE`](https://youtu.be/ISI_LINK_YOUTUBE)
- **Catatan rilis:** [docs/RELEASE_NOTES.md](docs/RELEASE_NOTES.md)

## Screenshot

| Login | Profil | Edit Profil |
| --- | --- | --- |
| ![Login](docs/screenshots/01-login.png) | ![Profil](docs/screenshots/02-profil.png) | ![Edit Profil](docs/screenshots/03-edit-profil.png) |

## Fitur Soal 2

- Login dengan `Form`, validator email, dan password minimal 6 karakter.
- Halaman profil menampilkan foto dari `assets/images/profile.jpeg`, nama, NIM,
  program studi, kelas, bio, serta kontak dengan `Card` + `ListTile`.
- Edit profil dengan validasi nama, email, dan nomor HP 10–13 digit. Data
  dikembalikan melalui `Navigator.pop` dan langsung ditampilkan dengan
  `setState()`.
- Halaman Tentang Saya berisi keahlian, hobi, dan riwayat pendidikan
  menggunakan `ListView`.
- `Scaffold` lengkap: `AppBar`, `Drawer`, `NavigationBar`, dan
  `FloatingActionButton`.
- Tema terang dan gelap tanpa gradient, dapat diganti langsung dari aplikasi.
- Nama aplikasi Android: **Profil Kenzie**.

## Menjalankan

```bash
cd soal2-profil-app
flutter pub get
flutter run
```

## Struktur Singkat

```text
soal2-profil-app/lib/
├── main.dart
├── models/profile.dart
├── screens/
│   ├── login_page.dart
│   ├── profile_page.dart
│   ├── edit_profile_page.dart
│   └── about_page.dart
├── theme/app_theme.dart
└── widgets/
    ├── info_tile.dart
    └── profile_avatar.dart
```

## Catatan

- Proyek Soal 1 tersedia di folder `soal1-live-coding/`.
- Ganti `ISI_LINK_YOUTUBE` dengan tautan video presentasi sebelum dikumpulkan.
