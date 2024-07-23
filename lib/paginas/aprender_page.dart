import 'package:flutter/material.dart';
import 'package:teste_prototipo/licoes/licao_conectar.dart';
import 'package:teste_prototipo/licoes/licao_l10.dart';
import 'package:teste_prototipo/licoes/licao_ptl2.dart';
import 'dart:math';

import 'package:teste_prototipo/widgets/botao_iniciar_licao.dart';
import 'package:teste_prototipo/widgets/botao_licao_inativa.dart';
import 'package:teste_prototipo/licoes/licao_flashcard.dart';

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
        color: Color.fromARGB(255, 237, 228, 222),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              decoration: BoxDecoration(
                color: Colors.white, // Background color of the button
                borderRadius: BorderRadius.circular(8.0), // Rounded corners
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  iconEnabledColor: Colors.black,
                  iconSize: 40,
                  focusColor: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  dropdownColor: Colors.white,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  value: _itemSelecionado,
                  items: _niveis.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Center(
                        child: Text(
                          dropDownStringItem,
                          style: TextStyle(
                            color: dropDownStringItem == "Nível 1"
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? novoItem) {
                    if (novoItem != null) {
                      _dropDownItemSelected(novoItem);
                    }
                  },
                  selectedItemBuilder: (BuildContext context) {
                    return _niveis.map<Widget>((String item) {
                      return Center(
                        child: Text(
                          _itemSelecionado,
                          style: TextStyle(
                            color: _itemSelecionado == "Nível 1"
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                      );
                    }).toList();
                  },
                ),
              ),
            ),
            BotaoIniciarLicao(
                number: 1,
                legenda: "Vocabulário",
                proximaPagina: LicaoPTL2() ),
            /*LicaoFlashcard(
                  qtdPerguntas: 1,
                )),*/
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
