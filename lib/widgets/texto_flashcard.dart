import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextoFlashcard extends StatelessWidget {
  final String texto;
  const TextoFlashcard(
    this.texto, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(this.texto,
          style: const TextStyle(
              fontSize: 40, fontWeight: FontWeight.w700, color: Colors.black)),
    );
  }
}
