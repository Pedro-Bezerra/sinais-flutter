import 'package:flutter/material.dart';

class BarraProgresso extends StatelessWidget {
  final int totalQuestoes;
  final int questoesCompletadas;


  BarraProgresso({required this.totalQuestoes, required this.questoesCompletadas});

  @override
  Widget build(BuildContext context) {
    double progress = questoesCompletadas / totalQuestoes;
    double resto = 1 - progress;

    return Container(
      width: MediaQuery.sizeOf(context).width*0.5,
      height: 20,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: 
          FractionallySizedBox(
            widthFactor: progress,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF054A91),
              ),
            ),
          ),
    );
  }
}