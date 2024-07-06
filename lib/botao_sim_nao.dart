import 'package:flutter/material.dart';

class BotaoSimNao extends StatelessWidget {
  final Color cor;
  final Icon icone;
  const BotaoSimNao(this.cor, this.icone, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: icone,
        style: ElevatedButton.styleFrom(
            backgroundColor: cor,
            shape: CircleBorder(),
            padding: EdgeInsets.all(20.0),
            foregroundColor: Colors.white));
  }
}
