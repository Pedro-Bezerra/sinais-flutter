import 'package:flutter/material.dart';
import 'dart:math';

class CabecalhoDrawer extends StatefulWidget {
  final String usuario;

  const CabecalhoDrawer({required this.usuario, super.key});

  @override
  State<CabecalhoDrawer> createState() => _CabecalhoDrawerState(usuario);
}

class _CabecalhoDrawerState extends State<CabecalhoDrawer> {
  final String usuario;

  _CabecalhoDrawerState(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 133, 199, 242),
          Color.fromARGB(255, 5, 74, 145)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        transform: GradientRotation(pi / 4),
      )),
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            height: 70,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(
                  'assets/images/perfil.jpg',
                ))),
          ),
          Text(
            usuario,
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
