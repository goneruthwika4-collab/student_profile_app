import 'package:flutter_test/flutter_test.dart';
import '../lib/main.dart';

void main() {
  testWidgets('Student Profile UI Test',
      (WidgetTester tester) async {
    await tester.pumpWidget(const StudentProfileApp());

    expect(find.text('Student Profile'), findsOneWidget);
    expect(find.text('Ruthwika G'), findsOneWidget);
    expect(find.text('Computer Science Engineering'),
        findsOneWidget);
    expect(find.text('View Profile'), findsOneWidget);

    await tester.tap(find.text('View Profile'));
    await tester.pump();

    expect(
      find.text('View Profile'),
      findsOneWidget,
    );
  });
}