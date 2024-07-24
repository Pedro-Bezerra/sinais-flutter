import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_prototipo/licoes/licao_ptl22.dart';
import 'package:teste_prototipo/paginas/inicio.dart';
import 'package:teste_prototipo/widgets/botao_de_progresso.dart';
import 'package:teste_prototipo/widgets/botao_proximo.dart';
import 'package:teste_prototipo/widgets/widget_progresso.dart';
import 'package:teste_prototipo/widgets/progresso.dart';

class LicaoPTL2 extends StatefulWidget {
  final int pontuacao;
  final int qtdPerguntas;

  LicaoPTL2({this.pontuacao = 0, required this.qtdPerguntas});

  @override
  _LicaoPTL2State createState() => _LicaoPTL2State(pontuacao, qtdPerguntas);
}

class _LicaoPTL2State extends State<LicaoPTL2> {
  String? _selectedButton;
  bool _buttonsDisabled = false;

  int pontuacao;
  int qtdPerguntas;
  bool acertou = false;

  _LicaoPTL2State(this.pontuacao, this.qtdPerguntas);

  void acertouAResposta() {
    setState(() {
      acertou = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BarraProgresso(totalQuestoes: 5, questoesCompletadas: 0),
            SizedBox(height: 20),
            Image.asset(
              'assets/images/lapis.jpg',
              width: 250,
              height: 250,
            ),
            SizedBox(height: 20),
            Text(
              'Escolha a palavra que representa a imagem',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            _buildButton(context, 'Borracha'),
            SizedBox(height: 10),
            _buildButton(context, 'Lápis'),
            SizedBox(height: 10),
            _buildButton(context, 'Caneta'),
            SizedBox(height: 20),
            BotaoNext(
              funcao:
                  _selectedButton != null && !_buttonsDisabled ? () {} : null,
              proximaPagina: _selectedButton != null && !_buttonsDisabled
                  ? LicaoPTL22(
                      pontuacao: acertou ? pontuacao + 1 : pontuacao,
                      qtdPerguntas: qtdPerguntas + 1,
                    )
                  : null,
              estaHabilitado: _selectedButton != null && !_buttonsDisabled,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String buttonLabel) {
    bool isSelected = _selectedButton == buttonLabel;
    Color buttonColor;

    if (_buttonsDisabled) {
      buttonColor = Colors.grey;
    } else if (_selectedButton == null) {
      buttonColor = Colors.grey;
    } else if (isSelected && buttonLabel == 'Lápis') {
      buttonColor = Colors.green;
      acertouAResposta();
    } else if (isSelected && buttonLabel != 'Lápis') {
      buttonColor = Colors.red;
    } else {
      buttonColor = Colors.grey;
    }

    return ElevatedButton(
      onPressed: _buttonsDisabled || (_selectedButton != null && !isSelected)
          ? null
          : () => _handleButtonClick(context, buttonLabel),
      child: Text(
        buttonLabel,
        style: TextStyle(color: isSelected ? Colors.white : Colors.black),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: Size(double.infinity, 50),
        backgroundColor: buttonColor,
      ),
    );
  }

  void _handleButtonClick(BuildContext context, String buttonClicked) {
    setState(() {
      _selectedButton = buttonClicked;
    });
    print('Botão $buttonClicked clicado!');
  }
}
