import 'package:flutter/material.dart';
import 'package:teste_prototipo/botao_proximo.dart';
import 'package:teste_prototipo/direcionamento.dart';
import 'package:teste_prototipo/texto_dragging.dart';
import 'package:teste_prototipo/video_player.dart';

class LicaoL10 extends StatefulWidget {
  @override
  _LicaoL10State createState() => _LicaoL10State();
}

class _LicaoL10State extends State<LicaoL10> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(flex: 2, child: VideoPlayerScreen()),
            TextoDirecionamento('Organize as palavras para formar uma frase'),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 5.0,
                    alignment: WrapAlignment.start,
                    runAlignment: WrapAlignment.start,
                    children: <Widget>[
                      TextoDragAndDrop("respondeu", "1"),
                      TextoDragAndDrop("aluna", "2"),
                      TextoDragAndDrop("A", "3"),
                      TextoDragAndDrop("prova", "4"),
                      TextoDragAndDrop("a", "5"),
                    ],
                  ),
                ],
              ),
            ),
            BotaoNext()
          ],
        ),
      ),
    );
  }
}
