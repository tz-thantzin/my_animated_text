import 'package:flutter_test/flutter_test.dart';

import 'package:example/main.dart';

void main() {
  testWidgets('example app renders demo sections', (WidgetTester tester) async {
    await tester.pumpWidget(const AnimatedTextExampleApp());

    expect(find.text('my_animated_text'), findsOneWidget);
    expect(find.text('Fluent composition'), findsOneWidget);
    expect(find.text('Signature animation styles'), findsOneWidget);
  });
}
