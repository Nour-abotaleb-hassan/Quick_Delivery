import 'package:flutter_test/flutter_test.dart';

import 'package:final_task/main.dart';

void main() {
  testWidgets('Doorstep welcome screen opens', (WidgetTester tester) async {
    await tester.pumpWidget(const DoorstepApp());
    expect(find.text('Hot and delicious food delivered right to your door.'), findsOneWidget);
  });
}
