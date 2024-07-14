import 'package:flutter/material.dart';

class TextoDirecionamento extends StatelessWidget {
  final String direcionamento;

  const TextoDirecionamento(this.direcionamento, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(direcionamento,
        style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 47, 47, 47)));
  }
}
