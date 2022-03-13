import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class TransferValueScreen{
  final Finder _alertDialogTitle = find.byKey(const Key('alertDialogTitle'));
  final Finder _alertDialogMessage = find.byKey(const Key('alertDialogMessage'));
  final Finder _alertDialogButtonOk = find.byKey(const Key('alertDialogButtonOk'));
  final Finder _buttonArrowContinue = find.byKey(const Key('buttonArrowContinue'));
  final Finder _textAvailableBalance = find.byKey(const Key('textAvailableBalance'));
  final Finder _inputTransferValue = find.byKey(const Key('inputTransferValue'));

  TransferValueScreen();

  Future<void> informValueToTransfer(WidgetTester tester, String value) async {
    //enter the data
    await tester.enterText(_inputTransferValue, value);
    await tester.pumpAndSettle();
  }

  Future<void> tapIconContinue(WidgetTester tester) async{
    await tester.tap(_buttonArrowContinue.last);
    //waits for the app load the next screen
    await tester.pumpAndSettle();
  }
}