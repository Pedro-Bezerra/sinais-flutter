import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

  int acertos = 0;
  int qtdPalavras = 5;

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
            WidgetProgresso(count: 3),
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
                      ),
                      TextoDragAndDrop(
                        resposta: "aluna",
                        ordem: "2",
                        onTextDropped: _handleTextDropped,
                      ),
                      TextoDragAndDrop(
                        resposta: "A",
                        ordem: "3",
                        onTextDropped: _handleTextDropped,
                      ),
                      TextoDragAndDrop(
                        resposta: "prova",
                        ordem: "4",
                        onTextDropped: _handleTextDropped,
                      ),
                      TextoDragAndDrop(
                        resposta: "a",
                        ordem: "5",
                        onTextDropped: _handleTextDropped,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            BotaoNext(
              funcao: () =>
                    Provider.of<ProgressManager>(context, listen: false)
                        .nextStep(),
              proximaPagina: ConectarColunas(qtdPerguntas: 2, pontuacao: pontuacao + 1,),
            )
          ],
        ),
      ),
    );
  }
}
