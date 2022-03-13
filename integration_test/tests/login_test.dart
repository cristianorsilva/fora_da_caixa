import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:intl/intl.dart';
import 'package:fora_da_caixa/main.dart' as app;
import '../screens/home_screen.dart';
import '../share/test_base.dart' as test_base;

import '../screens/login_not_remembered_screen.dart';
import '../share/test_extensions.dart';

Future<void> main() async {
  IntegrationTestWidgetsFlutterBinding binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized() as IntegrationTestWidgetsFlutterBinding;
  String dirFeature = "Feature Login/";
  String dirDateHour = test_base.defineDirectoryDateHour();
  String dirTestName = "";

  setUpAll(
    () async {
      if (Platform.isAndroid) {
        await binding.convertFlutterSurfaceToImage();
      }
    },
  );

  Future<void> _takeScrenshot(WidgetTester tester) async {
    await test_base.takeScreenshot(tester, binding, dirFeature, dirDateHour, dirTestName);
  }

  Future<void> _testingNewFeatures(WidgetTester tester) async {
    //starts the app
    await app.main();
    //wait for app to be settled
    await tester.pumpAndSettle();
    //define the directory for the test result
    dirTestName = "New feature test/";

    await _takeScrenshot(tester);

    //funciona
    tester.checkExpectedTextOnTextWidgets({
      LoginNotRememberedScreen().checkTextForgotPassword(tester, 'Esqueci a senha!'),
      LoginNotRememberedScreen().checkTextForgotPassword(tester, 'Esqueci a senha'),
      LoginNotRememberedScreen().checkTextForgotPassword(tester, 'Esqueci a senha@')
    });

    tester.expectTextOnTextWidget('Esqueci a senha', 'textForgotPassword');

    await _takeScrenshot(tester);
  }

  Future<void> _successfulLogin(WidgetTester tester) async {
    //starts the app
    await app.main();
    //wait for app to be settled
    await tester.pumpAndSettle();
    //define the directory for the test result
    dirTestName = "1 - Successful Login/";

    try {
      await LoginNotRememberedScreen().informUserAndPassword(tester, '92903540039', '172839');
      await _takeScrenshot(tester);
      await LoginNotRememberedScreen().tapButtonLogin(tester);
      //if logged with success, expects to find the welcome message for user
      HomeScreen().checkTextWelcomeUser(tester, 'Olá, João').call();
      await _takeScrenshot(tester);
    } catch (e) {
      await _takeScrenshot(tester);
      rethrow;
    }
  }

  Future<void> _wrongPasswordInformed(WidgetTester tester) async {
    //starts the app
    await app.main();
    //wait for app to be settled
    await tester.pumpAndSettle();
    //define the directory for the test result
    dirTestName = "2 - Invalid Password Informed/";

    try {
      await LoginNotRememberedScreen().informUserAndPassword(tester, '92903540039', '172838');
      await _takeScrenshot(tester);
      await LoginNotRememberedScreen().tapButtonLogin(tester);

      //expects to find message
      //expect(find.text('Usuário ou senha inválidos'), findsOneWidget);
      //expects to find message
      LoginNotRememberedScreen().checkTextAlertDialogMessage(tester, 'Usuário ou senha inválidos').call();

      await _takeScrenshot(tester);
    } catch (e) {
      await _takeScrenshot(tester);
      rethrow;
    }
  }

  Future<void> _nonExistentDocumentInformed(WidgetTester tester) async {
    //starts the app
    await app.main();
    //wait for app to be settled
    await tester.pumpAndSettle();
    //define the directory for the test result
    dirTestName = "3 - Non existent Document Informed/";

    try {
      await LoginNotRememberedScreen().informUserAndPassword(tester, '90691216037', '172839');
      await _takeScrenshot(tester);
      await LoginNotRememberedScreen().tapButtonLogin(tester);

      //expects to find message
      LoginNotRememberedScreen().checkTextAlertDialogMessage(tester, 'Usuário ou senha inválidos').call();

      await _takeScrenshot(tester);
    } catch (e) {
      await _takeScrenshot(tester);
      rethrow;
    }
  }

  group('Login Tests:', () {
    testWidgets(
        'TC 001 '
        'GIVEN I open the app '
        'AND I inform valid login and password, '
        'WHEN I tap Login button '
        'THEN I log in the app ',
        _successfulLogin);

    testWidgets(
        'TC 002 '
        'GIVEN I open the app '
        'AND I inform valid login '
        'AND I inform wrong password, '
        'WHEN I tap Login button '
        'THEN I see "Usuário ou senha inválidos" message ',
        _wrongPasswordInformed);

    testWidgets(
        'TC 003 '
        'GIVEN I open the app '
        'AND I inform inexistent login '
        'AND I inform valid password, '
        'WHEN I tap Login button '
        'THEN I see "Usuário ou senha inválidos" message ',
        _nonExistentDocumentInformed);

    testWidgets('Testing new features', _testingNewFeatures);
  });
}
