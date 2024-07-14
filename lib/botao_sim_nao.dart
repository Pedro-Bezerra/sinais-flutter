import 'package:flutter/material.dart';

class BotaoSimNao extends StatelessWidget {
  final Color cor;
  final Icon icone;
  final VoidCallback? funcao;
  const BotaoSimNao(
      {required this.cor, required this.icone, this.funcao, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: funcao,
        child: icone,
        style: ElevatedButton.styleFrom(
            backgroundColor: cor,
            shape: CircleBorder(),
            padding: EdgeInsets.all(20.0),
            foregroundColor: Colors.white));
  }
}
