import 'package:flutter_test/flutter_test.dart';
import 'package:flutterwomen/main.dart';

void main() {
  testWidgets('SheRise smoke test verifies app launch', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SheRiseApp());

    // Verify that the title text is rendered.
    expect(find.text('SheRise – Women Entrepreneurs'), findsOneWidget);
  });
}
