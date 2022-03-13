import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class TransferReceiptScreen {
  final Finder _singleChildScrowViewMain = find.byKey(const Key('singleChildScrowViewMain'));

  final Finder _gestureDetectorClose = find.byKey(const Key('gestureDetectorClose'));
  final Finder _gestureDetectorShare = find.byKey(const Key('gestureDetectorShare'));

  final Finder _textReceiptTitle = find.byKey(const Key('textReceiptTitle'));

  final Finder _textTransferDate = find.byKey(const Key('textTransferDate'));
  final Finder _textTransferValue = find.byKey(const Key('textTransferValue'));
  final Finder _textTransferType = find.byKey(const Key('textTransferType'));

  final Finder _textRecipientFullUserName = find.byKey(const Key('textRecipientFullUserName'));
  final Finder _textRecipientDocumentNumber = find.byKey(const Key('textRecipientDocumentNumber'));
  final Finder _textRecipientBankName = find.byKey(const Key('textRecipientBankName'));
  final Finder _textRecipientAgencyNumber = find.byKey(const Key('textRecipientAgencyNumber'));
  final Finder _textRecipientAccountNumber = find.byKey(const Key('textRecipientAccountNumber'));
  final Finder _textRecipientAccountType = find.byKey(const Key('textRecipientAccountType'));

  final Finder _textSenderFullUserName = find.byKey(const Key('textSenderFullUserName'));
  final Finder _textSenderDocumentNumber = find.byKey(const Key('textSenderDocumentNumber'));
  final Finder _textSenderBankName = find.byKey(const Key('textSenderBankName'));
  final Finder _textSenderAgencyNumber = find.byKey(const Key('textSenderAgencyNumber'));
  final Finder _textSenderAccountNumber = find.byKey(const Key('textSenderAccountNumber'));
  final Finder _textSenderAccountType = find.byKey(const Key('textSenderAccountType'));

  final Finder _textTransactionID = find.byKey(const Key('textTransactionID'));

  Future<void> dragClose(WidgetTester tester) async {
    await tester.dragUntilVisible(_gestureDetectorClose.last, _singleChildScrowViewMain.last, Offset.fromDirection(5.0));
    await tester.pumpAndSettle();
  }

  Future<void> tapClose(WidgetTester tester) async {
    await tester.tap(_gestureDetectorClose);
    //waits for the app load the next screen
    await tester.pumpAndSettle();
  }

  Future<void> tapShare(WidgetTester tester) async {
    await tester.tap(_gestureDetectorShare);
    //waits for the app load the next screen
    await tester.pumpAndSettle();
  }

  Function checkReceiptTitle(WidgetTester tester, String checkText) {
    return () {
      Text text = tester.widget(_textReceiptTitle.last) as Text;
      expect(text.data, checkText);
    };
  }

  Function checkTransferValue(WidgetTester tester, String checkText) {
    return () {
      Text text = tester.widget(_textTransferValue.last) as Text;
      expect(text.data, checkText);
    };
  }

  Function checkTransferWhen(WidgetTester tester, String checkText) {
    return () {
      Text text = tester.widget(_textTransferDate.last) as Text;
      expect(text.data?.substring(0, 10), checkText);
    };
  }

  Function checkTransferType(WidgetTester tester, String checkText) {
    return () {
      Text text = tester.widget(_textTransferType.last) as Text;
      expect(text.data, checkText);
    };
  }

  Function checkRecipientUserName(WidgetTester tester, String checkText) {
    return () {
      Text text = tester.widget(_textRecipientFullUserName.last) as Text;
      expect(text.data, checkText);
    };
  }

  Function checkRecipientDocumentNumber(WidgetTester tester, String checkText) {
    return () {
      Text text = tester.widget(_textRecipientDocumentNumber.last) as Text;
      expect(text.data, checkText);
    };
  }

  Function checkRecipientBankName(WidgetTester tester, String checkText) {
    return () {
      Text text = tester.widget(_textRecipientBankName.last) as Text;
      expect(text.data, checkText);
    };
  }

  Function checkRecipientAgencyNumber(WidgetTester tester, String checkText) {
    return () {
      Text text = tester.widget(_textRecipientAgencyNumber.last) as Text;
      expect(text.data, checkText);
    };
  }

  Function checkRecipientAccountNumber(WidgetTester tester, String checkText) {
    return () {
      Text text = tester.widget(_textRecipientAccountNumber.last) as Text;
      expect(text.data, checkText);
    };
  }

  Function checkRecipientAccountType(WidgetTester tester, String checkText) {
    return () {
      Text text = tester.widget(_textRecipientAccountType.last) as Text;
      expect(text.data, checkText);
    };
  }

  Function checkSenderUserName(WidgetTester tester, String checkText) {
    return () {
      Text text = tester.widget(_textSenderFullUserName.last) as Text;
      expect(text.data, checkText);
    };
  }

  Function checkSenderDocumentNumber(WidgetTester tester, String checkText) {
    return () {
      Text text = tester.widget(_textSenderDocumentNumber.last) as Text;
      expect(text.data, checkText);
    };
  }

  Function checkSenderBankName(WidgetTester tester, String checkText) {
    return () {
      Text text = tester.widget(_textSenderBankName.last) as Text;
      expect(text.data, checkText);
    };
  }

  Function checkSenderAgencyNumber(WidgetTester tester, String checkText) {
    return () {
      Text text = tester.widget(_textSenderAgencyNumber.last) as Text;
      expect(text.data, checkText);
    };
  }

  Function checkSenderAccountNumber(WidgetTester tester, String checkText) {
    return () {
      Text text = tester.widget(_textSenderAccountNumber.last) as Text;
      expect(text.data, checkText);
    };
  }

  Function checkSenderAccountType(WidgetTester tester, String checkText) {
    return () {
      Text text = tester.widget(_textSenderAccountType.last) as Text;
      expect(text.data, checkText);
    };
  }

  Function checkTransactionID(WidgetTester tester, String checkText) {
    return () {
      Text text = tester.widget(_textTransactionID.last) as Text;
      expect(text.data, checkText);
    };
  }

  Future<void> dragTransactionID(WidgetTester tester) async {
    await tester.dragUntilVisible(_textTransactionID.last, _singleChildScrowViewMain.last, Offset.fromDirection(5.0));

    await tester.pumpAndSettle();
  }
}
