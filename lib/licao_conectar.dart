import 'package:flutter/material.dart';
import 'package:teste_prototipo/botao_proximo.dart';
import 'package:teste_prototipo/conteudo_conectar.dart';
import 'package:teste_prototipo/direcionamento.dart';
import 'package:teste_prototipo/video_player.dart';

class ConectarColunas extends StatefulWidget {
  const ConectarColunas({super.key});

  @override
  State<ConectarColunas> createState() => _ConectarColunasState();
}

class _ConectarColunasState extends State<ConectarColunas> {
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
            BotaoNext(proximaPagina: Placeholder()),
          ],
        ),
      ),
    );
  }
}
