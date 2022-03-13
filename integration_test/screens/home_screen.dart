import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

class HomeScreen {
  final Finder _iconButtonEye = find.byKey(const Key('iconButtonEye'));
  final Finder _iconButtonQuestion = find.byKey(const Key('iconButtonQuestion'));
  final Finder _iconButtonExit = find.byKey(const Key('iconButtonExit'));

  final Finder _inkWellAccount = find.byKey(const Key('inkWellAccount'));
  final Finder _inkWellCredit = find.byKey(const Key('inkWellCredit'));

  final Finder _textWelcomeUserName = find.byKey(const Key('textWelcomeUserName'));
  final Finder _textAccountBalance = find.byKey(const Key('textAccountBalance'));
  final Finder _textCreditBalance = find.byKey(const Key('textCreditBalance'));

  final Finder _inkWellPix = find.byKey(const Key('inkWellPix'));
  final Finder _inkWellPayment = find.byKey(const Key('inkWellPayment'));
  final Finder _inkWellTransfer = find.byKey(const Key('inkWellTransfer'));
  final Finder _inkWellDeposit = find.byKey(const Key('inkWellDeposit'));
  final Finder _inkWellCellphoneTopUp = find.byKey(const Key('inkWellCellphoneTopUp'));

  HomeScreen();

  Function checkTextWelcomeUser(WidgetTester tester, String checkText) {
    return () {
      Text text = tester.widget(_textWelcomeUserName.last) as Text;
      expect(text.data, checkText);
    };
  }

  Future<void> tapPix(WidgetTester tester) async {
    await tester.tap(_inkWellPix.last);
    //waits for the app load the next screen
    await tester.pumpAndSettle();
  }


}
