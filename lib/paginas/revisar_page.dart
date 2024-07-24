import 'package:flutter/material.dart';
import 'dart:math';

class RevisarPage extends StatelessWidget {
  const RevisarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      color: Color.fromARGB(255, 237, 228, 222),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50,),
          Text(
            "Revisar lições",
            style: TextStyle(fontSize: 24),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade300),
                hintText: 'Buscar...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          BotaoRevisar(tema: "Gramática"),
          BotaoRevisar(tema: "Vocabulário"),
          BotaoRevisar(tema: "História"),
          BotaoRevisar(tema: "Leitura"),
          BotaoRevisar(tema: "Escrita"),
        ],
      ),
    ));
  }
}

class BotaoRevisar extends StatelessWidget {
  final String tema;

  const BotaoRevisar({super.key, required this.tema});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.13,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(177, 133, 199, 242),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            )),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(tema,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 79, 79, 79))),
            Icon(
              Icons.arrow_forward,
              color: Color.fromARGB(255, 79, 79, 79),
            )
          ],
        ),
      ),
    );
  }
}
