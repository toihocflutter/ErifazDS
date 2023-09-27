import 'package:erifaz_ds/components/statuslabel/status_label.dart';
import 'package:erifaz_ds/foundation/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../util.dart';

void main() {
  testWidgets('status label has a label', (tester) async {
    await tester.pumpWidget(TestUtils.buildTestWidget(const StatusLabel(
      label: 'Status label',
    )));

    final labelFinder = find.text('Status label');
    expect(labelFinder, findsOneWidget);
  });

  testWidgets('status label with default has correct value', (tester) async {
    await tester.pumpWidget(TestUtils.buildTestWidget(const StatusLabel(
      label: 'Status label',
    )));
    final textStyleFinder = tester.widget<Text>(find.byType(Text));
    expect(textStyleFinder.style?.color,
        const Color(ErifazDSColor.colorTextNeutral50));
    expect(textStyleFinder.style?.fontSize, StatusLabelSize.medium.textSize);

    final circleFinder = tester.widget<Container>(find.byType(Container));
    expect(
        circleFinder.constraints?.minWidth, StatusLabelSize.medium.circleSize);
    expect((circleFinder.decoration as BoxDecoration).color,
        StatusLabelColor.neutral.color);
  });

  testWidgets('status label with size small', (tester) async {
    await tester.pumpWidget(TestUtils.buildTestWidget(const StatusLabel(
      label: 'Status label',
      size: StatusLabelSize.small,
    )));

    final textStyleFinder = tester.widget<Text>(find.byType(Text));
    expect(textStyleFinder.style?.fontSize, StatusLabelSize.small.textSize);

    final circleFinder = tester.widget<Container>(find.byType(Container));
    expect(
        circleFinder.constraints?.minWidth, StatusLabelSize.small.circleSize);
  });

  testWidgets('status label with color red', (tester) async {
    await tester.pumpWidget(TestUtils.buildTestWidget(const StatusLabel(
      label: 'Status label',
      color: StatusLabelColor.red,
    )));

    final circleFinder = tester.widget<Container>(find.byType(Container));
    expect((circleFinder.decoration as BoxDecoration).color,
        StatusLabelColor.red.color);
  });
  testWidgets('status label with color green', (tester) async {
    await tester.pumpWidget(TestUtils.buildTestWidget(const StatusLabel(
      label: 'Status label',
      color: StatusLabelColor.green,
    )));

    final circleFinder = tester.widget<Container>(find.byType(Container));
    expect((circleFinder.decoration as BoxDecoration).color,
        StatusLabelColor.green.color);
  });
}
