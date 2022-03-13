import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

class VerifyDataScreen {
  final Finder _singleChildScrowViewMain = find.byKey(const Key('singleChildScrowViewMain'));
  final Finder _gestureDetectorChangeValue = find.byKey(const Key('gestureDetectorChangeValue'));
  final Finder _textTransferValue = find.byKey(const Key('textTransferValue'));
  final Finder _textRecipientFullUserName = find.byKey(const Key('textRecipientFullUserName'));
  final Finder _textTransferDate = find.byKey(const Key('textTransferDate'));
  final Finder _textTransferType = find.byKey(const Key('textTransferType'));
  final Finder _textRecipientDocumentNumber = find.byKey(const Key('textRecipientDocumentNumber'));
  final Finder _textRecipientBankName = find.byKey(const Key('textRecipientBankName'));
  final Finder _textRecipientAgencyNumber = find.byKey(const Key('textRecipientAgencyNumber'));
  final Finder _textRecipientAccountNumber = find.byKey(const Key('textRecipientAccountNumber'));

  final Finder _buttonTransfer = find.byKey(const Key('buttonTransfer'));

  Future<void> tapChangeValue(WidgetTester tester) async {
    await tester.tap(_gestureDetectorChangeValue);
    //waits for the app load the next screen
    await tester.pumpAndSettle();
  }

  Future<void> tapButtonTransfer(WidgetTester tester) async {
    await tester.tap(_buttonTransfer);
    await tester.pumpAndSettle();
  }

  Function checkTransferValue(WidgetTester tester, String checkText) {
    return () {
      Text text = tester.widget(_textTransferValue) as Text;
      expect(text.data, checkText);
    };
  }

  Function checkTransferWhen(WidgetTester tester, String checkText) {
    return () {
      Text text = tester.widget(_textTransferDate) as Text;
      expect(text.data, checkText);
    };
  }

  Function checkTransferType(WidgetTester tester, String checkText) {
    return () {
      Text text = tester.widget(_textTransferType) as Text;
      expect(text.data, checkText);
    };
  }

  Function checkRecipientUserName(WidgetTester tester, String checkText) {
    return () {
      Text text = tester.widget(_textRecipientFullUserName) as Text;
      expect(text.data, checkText);
    };
  }

  Function checkRecipientDocumentNumber(WidgetTester tester, String checkText) {
    return () {
      Text text = tester.widget(_textRecipientDocumentNumber) as Text;
      expect(text.data, checkText);
    };
  }

  Function checkRecipientBankName(WidgetTester tester, String checkText) {
    return () {
      Text text = tester.widget(_textRecipientBankName) as Text;
      expect(text.data, checkText);
    };
  }

  Function checkRecipientAgencyNumber(WidgetTester tester, String checkText) {
    return () {
      Text text = tester.widget(_textRecipientAgencyNumber) as Text;
      expect(text.data, checkText);
    };
  }

  Function checkRecipientAccountNumber(WidgetTester tester, String checkText) {
    return () {
      Text text = tester.widget(_textRecipientAccountNumber) as Text;
      expect(text.data, checkText);
    };
  }

  Future<void> dragRecipientAccountNumber(WidgetTester tester) async {
    await tester.dragUntilVisible(_textRecipientAccountNumber.last, _singleChildScrowViewMain.last, Offset.fromDirection(5.0));
    await tester.pumpAndSettle();
  }
}
