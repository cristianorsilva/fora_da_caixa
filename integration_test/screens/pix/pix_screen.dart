import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

class PixScreen{
  final Finder _inkWellPixTransfer = find.byKey(const Key('inkWellPixTransfer'));
  final Finder _inkWellPixReceive = find.byKey(const Key('inkWellPixReceive'));
  final Finder _inkWellPixCopyPaste = find.byKey(const Key('inkWellPixCopyPaste'));
  final Finder _inkWellPixQRPayment = find.byKey(const Key('inkWellPixQRPayment'));
  final Finder _inkWellPixMyKeys = find.byKey(const Key('inkWellPixMyKeys'));
  final Finder _inkWellPixFavorites = find.byKey(const Key('inkWellPixFavorites'));

  PixScreen();

  Future<void> tapPixTransfer(WidgetTester tester) async {
    await tester.tap(_inkWellPixTransfer);
    //waits for the app load the next screen
    await tester.pumpAndSettle();
  }

  Future<void> tapMyKeys(WidgetTester tester) async {
    await tester.tap(_inkWellPixMyKeys);
    //waits for the app load the next screen
    await tester.pumpAndSettle();
  }
}