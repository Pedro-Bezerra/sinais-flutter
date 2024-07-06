import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Titulo extends StatelessWidget {
  final String titulo;
  const Titulo(
    this.titulo, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(this.titulo,
        style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black));
  }
}
