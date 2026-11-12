# Catatan Rilis — v1.0.0

**Aplikasi:** Profil Kenzie  
**Versi:** 1.0.0+1  
**Tanggal rilis:** 12 November 2026

## Berkas APK

- **Nama file:** `app-release.apk`
- **Ukuran:** 49.029.974 byte (± 46,8 MB)
- **SHA-256:** `EF7109A6F1E368ECD19C2FED51041A67A6B3075267C5AAC15D96F0201761968A`

APK dapat diunduh dari halaman
[GitHub Releases v1.0.0](https://github.com/kenzifebri/uts-pml-1124160008/releases/tag/v1.0.0).
File APK tidak disimpan di dalam repository.

## Fitur

- Login dengan validasi email dan password (minimal 6 karakter)
- Halaman profil dengan foto, identitas, data akademik, dan kontak
- Edit profil dengan validasi nama, email, dan nomor HP 10–13 digit
- Data hasil edit dikirim kembali melalui `Navigator.pop` dan langsung
  ditampilkan dengan `setState()`
- Halaman Tentang Saya berisi keahlian, hobi, dan riwayat pendidikan
- Drawer, NavigationBar, dan FloatingActionButton
- Mode terang/gelap yang dapat diganti langsung dari aplikasi
- Nama aplikasi di Android: **Profil Kenzie**

## Cara memasang

1. Unduh `app-release.apk` dari GitHub Releases.
2. Aktifkan izin "Install unknown apps" pada perangkat Android.
3. Buka file APK dan pilih **Install**.
4. Jalankan aplikasi **Profil Kenzie**.

## Cara menjalankan dari source

```bash
cd soal2-profil-app
flutter pub get
flutter run
```
