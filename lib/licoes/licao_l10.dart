import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_prototipo/licoes/licao_ptl24.dart';
import 'package:teste_prototipo/widgets/botao_de_progresso.dart';
import 'package:teste_prototipo/widgets/botao_proximo.dart';
import 'package:teste_prototipo/licoes/licao_conectar.dart';
import 'package:teste_prototipo/widgets/direcionamento.dart';
import 'package:teste_prototipo/widgets/progresso.dart';
import 'package:teste_prototipo/widgets/texto_dragging.dart';
import 'package:teste_prototipo/widgets/video_player.dart';
import 'package:teste_prototipo/widgets/widget_progresso.dart';

class LicaoL10 extends StatefulWidget {
  final int pontuacao;
  final int qtdPerguntas;

  LicaoL10({this.pontuacao = 0, required this.qtdPerguntas});

  @override
  _LicaoL10State createState() => _LicaoL10State(pontuacao, qtdPerguntas);
}

class _LicaoL10State extends State<LicaoL10> {
  final int pontuacao;
  final int qtdPerguntas;

  _LicaoL10State(this.pontuacao, this.qtdPerguntas);

  void _handleTextDropped(String droppedText) {
    print("Text dropped: $droppedText");
    // Handle the dropped text as needed
  }

  bool anyRedBorder = false;

  void _handleRedBorderChanged(bool hasRedBorder) {
    setState(() {
      anyRedBorder = hasRedBorder;
    });
  }

  int acertos = 0;
  int qtdPalavras = 5;
  List<String> droppedTexts = [];
  List<bool> occupiedTargets = [false, false, false, false, false];

  bool estaTudoOcupado() {
    return occupiedTargets[0] &&
        occupiedTargets[1] &&
        occupiedTargets[2] &&
        occupiedTargets[3] &&
        occupiedTargets[4];
  }

  void _incrementarAcerto() {
    setState(() {
      ++acertos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            BarraProgresso(totalQuestoes: 5, questoesCompletadas: 3),
            Expanded(
                flex: 2,
                child: VideoPlayerScreen(
                  caminhoVideo: 'assets/videos/video_teste_libras.mp4',
                )),
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
                      TextoDragAndDrop(
                        resposta: "respondeu",
                        ordem: "1",
                        onTextDropped: _handleTextDropped,
                        droppedTexts: droppedTexts,
                        occupiedTargets: occupiedTargets,
                        index: 0,
                        onRedBorderChanged:
                            _handleRedBorderChanged, // Pass the callback
                      ),
                      TextoDragAndDrop(
                        resposta: "aluna",
                        ordem: "2",
                        onTextDropped: _handleTextDropped,
                        droppedTexts: droppedTexts,
                        occupiedTargets: occupiedTargets,
                        index: 1,
                        onRedBorderChanged:
                            _handleRedBorderChanged, // Pass the callback
                      ),
                      TextoDragAndDrop(
                        resposta: "A",
                        ordem: "3",
                        onTextDropped: _handleTextDropped,
                        droppedTexts: droppedTexts,
                        occupiedTargets: occupiedTargets,
                        index: 2,
                        onRedBorderChanged:
                            _handleRedBorderChanged, // Pass the callback
                      ),
                      TextoDragAndDrop(
                        resposta: "prova",
                        ordem: "4",
                        onTextDropped: _handleTextDropped,
                        droppedTexts: droppedTexts,
                        occupiedTargets: occupiedTargets,
                        index: 3,
                        onRedBorderChanged:
                            _handleRedBorderChanged, // Pass the callback
                      ),
                      TextoDragAndDrop(
                        resposta: "a",
                        ordem: "5",
                        onTextDropped: _handleTextDropped,
                        droppedTexts: droppedTexts,
                        occupiedTargets: occupiedTargets,
                        index: 4,
                        onRedBorderChanged:
                            _handleRedBorderChanged, // Pass the callback
                      ),
                    ],
                  ),
                ],
              ),
            ),
            BotaoNext(
              proximaPagina: estaTudoOcupado()
                  ? LicaoPTL24(
                      qtdPerguntas: qtdPerguntas + 1,
                      pontuacao: anyRedBorder ? pontuacao : pontuacao + 1,
                    )
                  : null,
              estaHabilitado: estaTudoOcupado(),
            )
          ],
        ),
      ),
    );
  }
}
