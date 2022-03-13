import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

class LoginNotRememberedScreen {
  final Finder _singleChildScrowViewMain = find.byKey(const Key('singleChildScrowViewMain'));
  final Finder _inputDocument= find.byKey(const Key('inputDocument'));
  final Finder _inputPassword= find.byKey(const Key('inputPassword'));
  final Finder _buttonLogin= find.byKey(const Key('buttonLogin'));
  final Finder _buttonForgotPassword= find.byKey(const Key('buttonForgotPassword'));
  final Finder _buttonNewUser= find.byKey(const Key('buttonNewUser'));
  final Finder _alertDialogTitle= find.byKey(const Key('alertDialogTitle'));
  final Finder _alertDialogMessage= find.byKey(const Key('alertDialogMessage'));
  final Finder _alertDialogButtonOk= find.byKey(const Key('alertDialogButtonOk'));

  LoginNotRememberedScreen();


  Future<void> informUserAndPassword(WidgetTester tester, String documentID, String password) async {
    //enter the data
    await tester.enterText(_inputDocument, documentID);
    await tester.enterText(_inputPassword, password);
    await simulateKeyUpEvent(LogicalKeyboardKey.escape);

    await tester.pumpAndSettle();
  }

  Future<void> dragButtonLogin(WidgetTester tester) async {
    await tester.dragUntilVisible(_buttonLogin.last, _singleChildScrowViewMain.last, Offset.fromDirection(5.0));
  }

  Future<void> tapButtonLogin(WidgetTester tester) async {
    //scrolls the screen does not work, so the drag until visible works well
    await tester.dragUntilVisible(_buttonLogin.last, _singleChildScrowViewMain.last, Offset.fromDirection(5.0));

    //await tester.tap(LoginNotRememberedScreen._finders.buttonLogin);
    await tester.tap(_buttonLogin.last);

    //waits for the app load the next screen
    await tester.pumpAndSettle();
  }

  Function checkTextForgotPassword(WidgetTester tester, String checkText) {
    return () {
      TextButton textButton = tester.widget(_buttonForgotPassword.last) as TextButton;
      Text text = textButton.child as Text;
      expect(text.data, checkText);
    };
  }

  Function checkTextAlertDialogMessage(WidgetTester tester, String checkText) {
    return () {
      Text text = tester.widget(_alertDialogMessage.last) as Text;
      expect(text.data, checkText);
    };
  }
}
