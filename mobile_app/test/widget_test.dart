import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:packmovers_mobile/main.dart';

void main() {
  testWidgets('booking flow reaches demo tracking with updated add-on total', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(430, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const PackMoversApp());
    await tester.pumpAndSettle();

    expect(find.text('PackMovers'), findsOneWidget);
    await tester.ensureVisible(find.text('Book a Move'));
    await tester.tap(find.text('Book a Move'));
    await tester.pumpAndSettle();

    expect(find.text('Where do you need to deliver?'), findsOneWidget);
    await tester.scrollUntilVisible(
      find.text('Core logistics services'),
      250,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('Core logistics services'), findsOneWidget);
    await tester.scrollUntilVisible(
      find.text('Vehicle fleet capacity guide'),
      250,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('Vehicle fleet capacity guide'), findsOneWidget);
    expect(tester.takeException(), isNull);
    await tester.scrollUntilVisible(
      find.text('Book a vehicle'),
      -300,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.text('Book a vehicle'));
    await tester.pumpAndSettle();

    expect(find.text('Select vehicle'), findsOneWidget);
    expect(find.text('₹210'), findsNWidgets(2));
    await tester.scrollUntilVisible(find.text('Packing assistance'), 250);
    await tester.tap(find.byType(Checkbox).first);
    await tester.pumpAndSettle();
    expect(find.text('₹330'), findsOneWidget);
    await tester.scrollUntilVisible(find.text('Category of goods'), 250);
    expect(find.text('CHITTOOR20'), findsOneWidget);
    expect(find.text('PackMovers Wallet'), findsOneWidget);
    expect(tester.takeException(), isNull);

    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();
    expect(find.text('Your driver is on the way'), findsOneWidget);
    expect(find.text('Trip status'), findsOneWidget);
    expect(find.text('DEMO ONLY'), findsOneWidget);
    expect(tester.takeException(), isNull);
    await tester.scrollUntilVisible(find.text('Cancel order'), 300);
    expect(
      find.text('Mittoor Industrial Warehouse · Sector 3'),
      findsOneWidget,
    );
    expect(find.text('Need help'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
