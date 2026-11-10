import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:profil_mahasiswa/main.dart';

void main() {
  testWidgets('halaman profil menampilkan identitas dan InfoTile', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Profil Mahasiswa'), findsOneWidget);
    expect(find.text(namaLengkap), findsOneWidget);
    expect(find.text(nim), findsOneWidget);
    expect(find.text(programStudi), findsOneWidget);

    // 4 InfoTile kontak + 3 hobi.
    expect(find.byType(InfoTile), findsNWidgets(7));
  });

  testWidgets('FloatingActionButton menampilkan SnackBar terima kasih', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    expect(
      find.text('Terima kasih telah melihat profil saya'),
      findsOneWidget,
    );
  });
}
