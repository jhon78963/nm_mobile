import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nm_mobile/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: NmMobileApp(),
      ),
    );

    await tester.pump();
    expect(find.text('Cargando sesión…'), findsOneWidget);
  });
}
