import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_prototipo/widgets/botao_de_progresso.dart';
import 'package:teste_prototipo/widgets/botao_proximo.dart';
import 'package:teste_prototipo/widgets/botao_sim_nao.dart';
import 'package:teste_prototipo/widgets/direcionamento.dart';
import 'package:teste_prototipo/licoes/licao_l10.dart';
import 'package:teste_prototipo/widgets/progresso.dart';
import 'package:teste_prototipo/widgets/texto_flashcard.dart';
import 'package:teste_prototipo/widgets/video_player.dart';
import 'package:teste_prototipo/widgets/widget_progresso.dart';
import '../widgets/flashcard.dart';

class LicaoFlashcard extends StatefulWidget {
  final int pontuacao;
  final int qtdPerguntas;

  LicaoFlashcard({this.pontuacao = 0, required this.qtdPerguntas});

  @override
  _LicaoFlashcardState createState() =>
      _LicaoFlashcardState(pontuacao, qtdPerguntas);
}

class _LicaoFlashcardState extends State<LicaoFlashcard> {
  final int pontuacao;
  final int qtdPerguntas;

  _LicaoFlashcardState(this.pontuacao, this.qtdPerguntas);

  String video = 'assets/videos/video_teste_libras.mp4';
  String palavra = 'BORRACHA';
  int indice = 1;
  int quantidade = 5;
  int acertos = 1;
  int erros = 0;
  List<String> palavras = [
    "BORRACHA",
    "CANETA",
    "PROFESSORA",
    "ALUNO",
    "PROVA"
  ];

  void _cliqueNoBotaoSimNao(
      String novoVideo, String novaPalavra, int novoIndice) {
    setState(() {
      video = novoVideo;
      palavra = novaPalavra;
      indice = novoIndice;
    });
  }

  void _incrementarAcerto() {
    setState(() {
      ++acertos;
    });
  }

  void _incrementarErro() {
    setState(() {
      ++erros;
    });
  }

  Map<String, dynamic> _getNextValues() {
    if (indice != quantidade) {
      String nextVideo = 'assets/videos/video_teste_libras.mp4';
      String nextPalavra = palavras[indice];
      int nextIndice = indice + 1;

      return {
        'video': nextVideo,
        'palavra': nextPalavra,
        'indice': nextIndice,
      };
    }

    return {
      'video': 'assets/videos/video_teste_libras.mp4',
      'palavra': "PROVA",
      'indice': 5,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BarraProgresso(totalQuestoes: 5, questoesCompletadas: 2),
            Flashcard(
              front: VideoPlayerScreen(caminhoVideo: video),
              back: Container(
                color: Colors.white,
                child: TextoFlashcard(palavra),
              ),
            ),
            TextoDirecionamento(
              "Marque se você reconhece o sinal sem precisar olhar a resposta",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BotaoSimNao(
                  cor: Colors.red,
                  icone: Icon(Icons.thumb_down),
                  funcao: () {
                    final nextValues = _getNextValues();
                    _cliqueNoBotaoSimNao(
                      nextValues['video'],
                      nextValues['palavra'],
                      nextValues['indice'],
                    );
                    _incrementarErro();
                  },
                ),
                BotaoSimNao(
                  cor: Colors.green,
                  icone: Icon(Icons.thumb_up),
                  funcao: () {
                    final nextValues = _getNextValues();
                    _cliqueNoBotaoSimNao(
                      nextValues['video'],
                      nextValues['palavra'],
                      nextValues['indice'],
                    );
                    _incrementarAcerto();
                    print(acertos);
                  },
                ),
              ],
            ),
            Text(
              "$indice/$quantidade",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
            ),
            BotaoNext(
              proximaPagina: indice == quantidade
                  ? LicaoL10(
                      qtdPerguntas: qtdPerguntas + 1,
                      pontuacao:
                          erros == 0 ? pontuacao + 1 : pontuacao,
                    )
                  : null,
              estaHabilitado: indice == quantidade,
            ),
          ],
        ),
      ),
    );
  }
}
