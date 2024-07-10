import 'package:flutter/material.dart';
import 'package:teste_prototipo/botao_proximo.dart';
import 'package:teste_prototipo/direcionamento.dart';
import 'package:teste_prototipo/video_player.dart';

class ConectarColunas extends StatefulWidget {
  const ConectarColunas({super.key});

  @override
  State<ConectarColunas> createState() => _ConectarColunasState();
}

class _ConectarColunasState extends State<ConectarColunas> {
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
              child: TextoDirecionamento("Conecte a imagem com o sinal")),
          Expanded(
              flex: 5,
              child: SingleChildScrollView(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ConteudoConectar(child: VideoPlayerScreen()),
                      ConteudoConectar(
                          child: Image.asset("assets/images/frase.png"))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ConteudoConectar(child: VideoPlayerScreen()),
                      ConteudoConectar(
                          child: Image.asset("assets/images/frase.png"))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ConteudoConectar(child: VideoPlayerScreen()),
                      ConteudoConectar(
                          child: Image.asset("assets/images/frase.png"))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ConteudoConectar(child: VideoPlayerScreen()),
                      ConteudoConectar(
                          child: Image.asset("assets/images/frase.png"))
                    ],
                  ),
                ],
              ))),
          BotaoNext(proximaPagina: Placeholder())
        ],
      ),
    ));
  }
} // Import for video player

class ConteudoConectar extends StatelessWidget {
  final Widget child;

  ConteudoConectar({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.3,
      child: child,
    );
  }
}
