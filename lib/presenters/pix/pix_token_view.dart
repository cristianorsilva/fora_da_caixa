import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../database/pix_key_type.dart';
import '../../database/user_pix_key.dart';
import '../../design_system/visibility/visibility_loading_fc.dart';
import '../../design_system/visibility/visibility_shadow_fc.dart';
import '../../share/alert_dialog_fc.dart';

class PixTokenView extends StatefulWidget {
  final UserPixKey userPixKey;
  final EnumPixKeyType enumPixKeyType;

  const PixTokenView({Key? key, required this.userPixKey, required this.enumPixKeyType}) : super(key: key);

  @override
  _PixTokenViewState createState() => _PixTokenViewState();
}

class _PixTokenViewState extends State<PixTokenView> {

  final TextEditingController _textTokenController = TextEditingController();
  bool _loadingIsVisible = false;
  bool _isCountdownVisible = true;
  late Timer _timer;
  int _start = 50;

  @override
  void initState() {
    super.initState();
    setState(() {
      startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Stack(children: [
          Container(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    //Text(definePixKeyOnPage(widget.enumPixKeyType!), style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                    Text('Insira o código enviado para ' + widget.userPixKey.keyPix, style: Theme.of(context).textTheme.headline1),
                    const Padding(padding: EdgeInsets.only(top: 50.0)),

                    TextField(
                      controller: _textTokenController,
                      decoration: InputDecoration(
                        hintText: '000000',
                        enabledBorder: const OutlineInputBorder(),
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor)),
                        floatingLabelStyle: TextStyle(color: Theme.of(context).primaryColor),
                        hintStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      keyboardType: const TextInputType.numberWithOptions(decimal: false),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(6),
                      ],
                      //enabled: _isTextTokenEnabled,
                      onChanged: (token) async {
                        if (token.length == 6) {
                          setState(() {
                            _loadingIsVisible = true;
                          });
                          int timeDelayed = 2 + Random().nextInt(3);
                          await Future.delayed(Duration(seconds: timeDelayed));

                          if (token == '123456') {

                            //TODO: acessa o banco e salva a nova chave
                            //fecha a tela e volta pra tela principal de Pix
                            //mostra toast de chave inserida com sucesso.



                          } else {
                            setState(() {
                              _loadingIsVisible = false;
                            });
                            await showAlertDialog('Automação Fora da Caixa', 'Token informado é inválido!', context, 'alertDialogTitle', 'alertDialogMessage',
                            'alertDialogButtonOk');
                          }
                        }
                      },
                    ),
                    const Padding(padding: EdgeInsets.only(top: 30)),

                    Visibility(
                      visible: !_isCountdownVisible,
                      child: Row(
                        children: [
                          InkWell(
                            child: Text('Solicitar novo código',
                                style: Theme.of(context).textTheme.headline5),
                            onTap: () {
                              if (_start == 50) {
                                startTimer();
                                _isCountdownVisible = true;
                              }
                            },
                          ),
                          const Padding(padding: EdgeInsets.only(left: 10)),
                          const Icon(
                            Icons.arrow_forward_rounded,
                          )
                        ],
                      ),
                    ),

                    Visibility(visible: _isCountdownVisible, child: Text('Voce pode solicitar um novo código em $_start segundos'))
                  ]))),
          VisibilityShadowFC(isVisible: _loadingIsVisible),
          VisibilityLoadingFC(isVisible: _loadingIsVisible),
        ]));
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            _start = 50;
            _isCountdownVisible = false;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }
}

//TODO: cadastrar a chave de email ou telefone e retornar toast, exibir loading.....