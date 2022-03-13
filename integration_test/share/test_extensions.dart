import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

extension CheckCompareTextResults on String {
  void checkCompareResults(List<String> list) {}
}

extension CheckText on WidgetTester {
  /// Checks if a [textToFind] is present on a specific Text Widget with key [textWidgetKey]
  void expectTextOnTextWidget(String textToFind, String textWidgetKey) {
    ///Searches for the expected Text Widget based on data and key parameters
    Finder expectedFind = find.byWidgetPredicate((widget) => widget is Text && widget.key == Key(textWidgetKey) && widget.data == textToFind);

    ///Searches for the Text Widget based only on key parameter
    Text textWidget = widget(find.byKey(Key(textWidgetKey)));

    String reasonToNotFind =
        'Era esperado encontrar o texto $textToFind no Test Widget de key $textWidgetKey, o que não foi encontrado. O Text Widget apresentou o texto ${textWidget.data}';

    expect(expectedFind, findsOneWidget, reason: reasonToNotFind);
  }

  void checkExpectedTextOnTextWidgets(Set<Function> setFunction) {
    String result = '';

    for (Function function in setFunction) {
      try {
        function.call();
      } on TestFailure catch (testFailure, e) {
        result += testFailure.message ?? '';
      }
    }
    if (result.isNotEmpty) fail(result);
  }
}
