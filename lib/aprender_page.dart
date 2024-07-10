import 'package:flutter/material.dart';
import 'dart:math';

import 'package:teste_prototipo/botao_iniciar_licao.dart';
import 'package:teste_prototipo/botao_licao_inativa.dart';
import 'package:teste_prototipo/licao_flashcard.dart';

class AprenderPage extends StatefulWidget {
  const AprenderPage({super.key});

  @override
  State<AprenderPage> createState() => _AprenderPageState();
}

class _AprenderPageState extends State<AprenderPage> {
  List<String> _niveis = [
    "Nível 1",
    "Nível 2",
    "Nível 3",
    "Nível 4",
    "Nível 5"
  ];

  String _itemSelecionado = "Nível 1";

  void _dropDownItemSelected(String novoItem) {
    setState(() {
      _itemSelecionado = novoItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 133, 199, 242),
              Color.fromARGB(255, 5, 74, 145)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            transform: GradientRotation(pi / 4),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                decoration: BoxDecoration(
                  color: Colors.white, // Background color of the button
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                ),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                  underline: Container(
                    height: 2,
                    color: Colors.white, // Underline color
                  ),
                  iconEnabledColor: Colors.black,
                  iconSize: 30,
                  focusColor: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  dropdownColor: Colors.white,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  value: _itemSelecionado,
                  items: _niveis.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  onChanged: (String? novoItem) {
                    if (novoItem != null) {
                      _dropDownItemSelected(novoItem);
                    }
                  },
                ))),
            BotaoIniciarLicao(number: 1, legenda: "Vocabulário", proximaPagina: LicaoFlashcard()),
            Icon(Icons.circle,
                color: Color.fromARGB(255, 203, 203, 203), size: 15),
            Icon(Icons.circle,
                color: Color.fromARGB(255, 203, 203, 203), size: 15),
            Icon(Icons.circle,
                color: Color.fromARGB(255, 203, 203, 203), size: 15),
            BotaoLicaoInativa(legenda: "Gramática"),
            Icon(Icons.circle,
                color: Color.fromARGB(255, 203, 203, 203), size: 15),
            Icon(Icons.circle,
                color: Color.fromARGB(255, 203, 203, 203), size: 15),
            Icon(Icons.circle,
                color: Color.fromARGB(255, 203, 203, 203), size: 15),
            BotaoLicaoInativa(legenda: "Escrita"),
          ],
        ),
      ),
    );
  }
}
