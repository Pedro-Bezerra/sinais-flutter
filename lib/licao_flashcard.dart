import 'package:flutter/material.dart';
import 'package:teste_prototipo/botao_proximo.dart';
import 'package:teste_prototipo/botao_sim_nao.dart';
import 'package:teste_prototipo/direcionamento.dart';
import 'package:teste_prototipo/texto_flashcard.dart';
import 'package:teste_prototipo/video_player.dart';
import 'flashcard.dart';

class LicaoFlashcard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            width: MediaQuery.sizeOf(context).width,
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flashcard(
                    front: VideoPlayerScreen(),
                    back: Container(
                        color: Colors.white,
                        child: TextoFlashcard("BORRACHA"))),
                TextoDirecionamento(
                    "Marque se você reconhece o sinal sem precisar olhar a resposta"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BotaoSimNao(Colors.red, Icon(Icons.thumb_down)),
                    BotaoSimNao(Colors.green, Icon(Icons.thumb_up))
                  ],
                ),
                BotaoNext()
              ],
            )),
      ),
    );
  }
}
