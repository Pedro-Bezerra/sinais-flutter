import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_prototipo/licoes/licao_ptl22.dart';
import 'package:teste_prototipo/paginas/inicio.dart';
import 'package:teste_prototipo/widgets/botao_proximo.dart';
import 'package:teste_prototipo/widgets/widget_progresso.dart';
import 'package:teste_prototipo/widgets/progresso.dart';

class LicaoPTL2 extends StatefulWidget {
  @override
  _LicaoPTL2State createState() => _LicaoPTL2State();
}

class _LicaoPTL2State extends State<LicaoPTL2> {
  String? _selectedButton;
  bool _buttonsDisabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Provider.of<ProgressManager>(context, listen: false).reset();
              MaterialPageRoute(
                builder: (context) => InicioPage(
                    usuario: "Vitinho", email: "vitor.farias@upe.br"),
              );
            },
          ),
        ],
      ),
      backgroundColor: Color(0xFFD9D9D9),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            WidgetProgresso(count: 5),
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
              funcao: _selectedButton != null && !_buttonsDisabled
                  ? () {
                      Provider.of<ProgressManager>(context, listen: false)
                          .nextStep();
                      setState(() {
                        _buttonsDisabled = true;
                      });
                    }
                  : null,
              proximaPagina: _selectedButton != null && !_buttonsDisabled
                  ? LicaoPTL22()
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