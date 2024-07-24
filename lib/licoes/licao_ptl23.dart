import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_prototipo/licoes/licao_ptl24.dart';
import 'package:teste_prototipo/paginas/inicio.dart';
import 'package:teste_prototipo/widgets/botao_de_progresso.dart';
import 'package:teste_prototipo/widgets/botao_proximo.dart';
import 'package:teste_prototipo/widgets/widget_progresso.dart';
import 'package:teste_prototipo/widgets/progresso.dart'; // Certifique-se de importar o WidgetProgresso aqui também

class LicaoPTL23 extends StatefulWidget {
  final int pontuacao;
  final int qtdPerguntas;

  LicaoPTL23({this.pontuacao = 0, required this.qtdPerguntas});

  @override
  _LicaoPTL23State createState() => _LicaoPTL23State(pontuacao, qtdPerguntas);
}

class _LicaoPTL23State extends State<LicaoPTL23> {
  int pontuacao;
  int qtdPerguntas;

  _LicaoPTL23State(this.pontuacao, this.qtdPerguntas);

  Map<String, String?> _imageToButtonMap = {
    'Imagem 1': null,
    'Imagem 2': null,
    'Imagem 3': null,
    'Imagem 4': null,
  };

  Map<String, Color> _buttonColors = {
    'Botão 1': Colors.blue,
    'Botão 2': Colors.yellow,
    'Botão 3': Colors.red,
    'Botão 4': Colors.green,
  };

  String? _selectedButton;

  double get imageSize => MediaQuery.of(context).size.width * 0.35;

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
          children: <Widget>[
            BarraProgresso(totalQuestoes: 5, questoesCompletadas: 2),
            SizedBox(height: 20),
            Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _buildImage('Imagem 1'),
                          SizedBox(width: 20),
                          _buildImage('Imagem 2'),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _buildImage('Imagem 3'),
                          SizedBox(width: 20),
                          _buildImage('Imagem 4'),
                        ],
                      ),
                    ],
                  ),
                )),
            SizedBox(height: 20),
            Text(
              'Ligue o verbo com a ação',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildButton('Botão 1'),
                SizedBox(width: 20),
                _buildButton('Botão 2'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildButton('Botão 3'),
                SizedBox(width: 20),
                _buildButton('Botão 4'),
              ],
            ),
            SizedBox(height: 20),
            BotaoNext(
              funcao: _canProceed() ? _navigateToLicaoPTL24 : null,
              estaHabilitado: _canProceed(),
              proximaPagina: _canProceed() ? LicaoPTL24(pontuacao: pontuacao + 1, qtdPerguntas: qtdPerguntas + 1,) : null,
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToLicaoPTL24() {}

  Widget _buildImage(String identifier) {
    String? selectedButton = _imageToButtonMap[identifier];
    Color borderColor = selectedButton != null
        ? _buttonColors[selectedButton]!
        : Colors.transparent;

    return GestureDetector(
      onTap: () {
        if (_selectedButton != null) {
          _handleImageClick(identifier);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 4),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Image.network(
          'assets/images/coruja.jpg',
          width: imageSize,
          height: imageSize,
        ),
      ),
    );
  }

  Widget _buildButton(String identifier) {
    bool isSelected = _selectedButton == identifier;
    Color buttonColor = isSelected ? _buttonColors[identifier]! : Colors.grey;

    return ElevatedButton(
      onPressed: () {
        _handleButtonClick(identifier);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
      ),
      child: Text(identifier),
    );
  }

  void _handleImageClick(String imageName) {
    setState(() {
      _imageToButtonMap[imageName] = _selectedButton;
    });
    print('Imagem $imageName clicada!');
  }

  void _handleButtonClick(String buttonName) {
    setState(() {
      _selectedButton = buttonName;
    });
    print('Botão $buttonName clicado!');
  }

  bool _canProceed() {
    Set<String?> uniqueSelections = _imageToButtonMap.values.toSet();
    return _imageToButtonMap.values.every((selection) => selection != null) &&
        uniqueSelections.length == _imageToButtonMap.values.length;
  }
}
