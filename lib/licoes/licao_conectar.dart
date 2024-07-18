import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_prototipo/paginas/resultado_page.dart';
import 'package:teste_prototipo/widgets/botao_proximo.dart';
import 'package:teste_prototipo/widgets/conteudo_conectar.dart';
import 'package:teste_prototipo/widgets/direcionamento.dart';
import 'package:teste_prototipo/widgets/progresso.dart';
import 'package:teste_prototipo/widgets/video_player.dart';
import 'package:teste_prototipo/widgets/widget_progresso.dart';

class ConectarColunas extends StatefulWidget {
  final int pontuacao;
  final int qtdPerguntas;

  const ConectarColunas(
      {required this.qtdPerguntas, this.pontuacao = 0, super.key});

  @override
  State<ConectarColunas> createState() =>
      _ConectarColunasState(pontuacao, qtdPerguntas);
}

class _ConectarColunasState extends State<ConectarColunas> {
  final int pontuacao;
  final int qtdPerguntas;

  _ConectarColunasState(this.pontuacao, this.qtdPerguntas);

  int _selectedIndex = -1;

  void _handleItemClick(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            WidgetProgresso(count: 3),
            Expanded(
              flex: 1,
              child: TextoDirecionamento("Conecte a imagem com o sinal"),
            ),
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ConteudoConectar(
                          child: VideoPlayerScreen(
                            caminhoVideo:
                                'assets/videos/video_teste_libras.mp4',
                          ),
                          onClick: () => _handleItemClick(0),
                          isSelected: _selectedIndex == 0,
                        ),
                        ConteudoConectar(
                          child: Image.asset("assets/images/frase.png"),
                          onClick: () => _handleItemClick(1),
                          isSelected: _selectedIndex == 1,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ConteudoConectar(
                          child: VideoPlayerScreen(
                            caminhoVideo:
                                'assets/videos/video_teste_libras.mp4',
                          ),
                          onClick: () => _handleItemClick(2),
                          isSelected: _selectedIndex == 2,
                        ),
                        ConteudoConectar(
                          child: Image.asset("assets/images/frase.png"),
                          onClick: () => _handleItemClick(3),
                          isSelected: _selectedIndex == 3,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ConteudoConectar(
                          child: VideoPlayerScreen(
                            caminhoVideo:
                                'assets/videos/video_teste_libras.mp4',
                          ),
                          onClick: () => _handleItemClick(4),
                          isSelected: _selectedIndex == 4,
                        ),
                        ConteudoConectar(
                          child: Image.asset("assets/images/frase.png"),
                          onClick: () => _handleItemClick(5),
                          isSelected: _selectedIndex == 5,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ConteudoConectar(
                          child: VideoPlayerScreen(
                            caminhoVideo:
                                'assets/videos/video_teste_libras.mp4',
                          ),
                          onClick: () => _handleItemClick(6),
                          isSelected: _selectedIndex == 6,
                        ),
                        ConteudoConectar(
                          child: Image.asset("assets/images/frase.png"),
                          onClick: () => _handleItemClick(7),
                          isSelected: _selectedIndex == 7,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            BotaoNext(
                funcao: () =>
                    Provider.of<ProgressManager>(context, listen: false)
                        .nextStep(),
                proximaPagina: TelaDeResultado(
                  acertos: pontuacao,
                  erros: qtdPerguntas +
                      1 -
                      pontuacao, // + 1 porque tem que somar com essa
                )),
          ],
        ),
      ),
    );
  }
}
