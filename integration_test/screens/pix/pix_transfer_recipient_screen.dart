import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fora_da_caixa/database/pix_key_type.dart';

class PixTransferRecipientScreen{
  final Finder _choiceChipPixKeyCPFCNPJ = find.byKey(const Key('choiceChipPixKeyCPFCNPJ'));
  final Finder _choiceChipPixKeyAleatory = find.byKey(const Key('choiceChipPixKeyAleatory'));
  final Finder _choiceChipPixKeyCellphone = find.byKey(const Key('choiceChipPixKeyCellphone'));
  final Finder _choiceChipPixKeyEmail = find.byKey(const Key('choiceChipPixKeyEmail'));

  final Finder _buttonArrowContinue = find.byKey(const Key('buttonArrowContinue'));

  final Finder _alertDialogTitle = find.byKey(const Key('alertDialogTitle'));
  final Finder _alertDialogMessage = find.byKey(const Key('alertDialogMessage'));
  final Finder _alertDialogButtonOk = find.byKey(const Key('alertDialogButtonOk'));

  final Finder _textValueTransfer = find.byKey(const Key('textValueTransfer'));
  final Finder _inputPixKey = find.byKey(const Key('inputPixKey'));


  Future<void> selectPixKeyType(WidgetTester tester, EnumPixKeyType enumPixKeyType) async {
    switch (enumPixKeyType) {
      case EnumPixKeyType.cpf_cnpj:
        await tester.tap(_choiceChipPixKeyCPFCNPJ);
        break;
      case EnumPixKeyType.chave_aleatoria:
        await tester.tap(_choiceChipPixKeyAleatory);
        break;
      case EnumPixKeyType.telefone:
        await tester.tap(_choiceChipPixKeyCellphone);
        break;
      case EnumPixKeyType.email:
        await tester.tap(_choiceChipPixKeyEmail);
        break;
    }

    //waits for the app load the next screen
    await tester.pumpAndSettle();
  }

  Future<void> informPixKeyToTransfer(WidgetTester tester, String value) async {
    //enter the data
    await tester.enterText(_inputPixKey, value);
    await tester.pumpAndSettle();
  }

  Future<void> tapIconContinue(WidgetTester tester) async {
    await tester.tap(_buttonArrowContinue.last);
    //waits for the app load the next screen
    await tester.pumpAndSettle();
  }

}