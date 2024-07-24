import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_prototipo/licoes/licao_ptl22.dart';
import 'package:teste_prototipo/licoes/licao_ptl25.dart';
import 'package:teste_prototipo/paginas/inicio.dart';
import 'package:teste_prototipo/paginas/resultado_page.dart';
import 'package:teste_prototipo/widgets/botao_de_progresso.dart';
import 'package:teste_prototipo/widgets/botao_proximo.dart';
import 'package:teste_prototipo/widgets/widget_progresso.dart';
import 'package:teste_prototipo/widgets/progresso.dart'; // Importar o ProgressManager

class LicaoPTL24 extends StatefulWidget {
  final int pontuacao;
  final int qtdPerguntas;

  LicaoPTL24({this.pontuacao = 0, required this.qtdPerguntas});

  @override
  _LicaoPTL24State createState() => _LicaoPTL24State(pontuacao, qtdPerguntas);
}

class _LicaoPTL24State extends State<LicaoPTL24> {
  int pontuacao;
  int qtdPerguntas;

  _LicaoPTL24State(this.pontuacao, this.qtdPerguntas);

  String? _selectedButton;
  String? _selectedSpace1;
  String? _selectedSpace2;
  String? _selectedSpace3;
  String? _selectedSpace4;

  List<bool> acertos = [false, false, false, false];

  void acertouAResposta(int indice) {
    setState(() {
      acertos[indice] = true;
    });
  }

  void errouAResposta(int indice) {
    setState(() {
      acertos[indice] = false;
    });
  }

  bool acertou() {
    return acertos[0] && acertos[1] && acertos[2] && acertos[3];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            BarraProgresso(totalQuestoes: 5, questoesCompletadas: 4),
            SizedBox(height: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildSentence('A caneta é ', _selectedSpace1,
                      () => _handleSpaceClick(1)),
                  SizedBox(height: 10),
                  _buildSentence('O professor é ', _selectedSpace2,
                      () => _handleSpaceClick(2)),
                  SizedBox(height: 10),
                  _buildSentence('A matéria é ', _selectedSpace3,
                      () => _handleSpaceClick(3)),
                  SizedBox(height: 10),
                  _buildSentence('O caderno é ', _selectedSpace4,
                      () => _handleSpaceClick(4)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Complete a frase com o adjetivo correto',
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
                _buildAdjectiveButton('Bonito'),
                SizedBox(width: 20),
                _buildAdjectiveButton('Difícil'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildAdjectiveButton('Inteligente'),
                SizedBox(width: 20),
                _buildAdjectiveButton('Azul'),
              ],
            ),
            SizedBox(height: 20),
            /*BotaoNext(
              funcao: _canProceed() ? () {} : null,
              estaHabilitado: _canProceed(),
              proximaPagina: _canProceed() ? LicaoPTL25(pontuacao: acertou ? pontuacao + 1 : pontuacao, qtdPerguntas: qtdPerguntas + 1,) : null,
            )*/
            BotaoNext(
              funcao: _canProceed() ? () {} : null,
              estaHabilitado: _canProceed(),
              proximaPagina: _canProceed()
                  ? TelaDeResultado(
                      acertos: acertou() ? pontuacao + 1 : pontuacao,
                      erros: acertou()
                          ? qtdPerguntas - pontuacao - 1
                          : qtdPerguntas - pontuacao)
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSentence(
      String text, String? selectedAdjective, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Text(
              selectedAdjective ?? '______',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdjectiveButton(String label) {
    return ElevatedButton(
      onPressed: () {
        _handleButtonClick(label);
      },
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor:
            label == 'Azul' ? Color(0xFF054A91) : Color(0xFF054A91),
        minimumSize: Size(150, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  void _handleButtonClick(String buttonLabel) {
    setState(() {
      _selectedButton = buttonLabel;
    });
    print('Botão $buttonLabel clicado!');
  }

  void _handleSpaceClick(int spaceNumber) {
    if (_selectedButton != null) {
      setState(() {
        switch (spaceNumber) {
          case 1:
            _selectedSpace1 = _selectedButton;
            if (_selectedButton == "Azul") {
              acertouAResposta(0);
            } else {
              errouAResposta(0);
            }
            break;
          case 2:
            _selectedSpace2 = _selectedButton;
            if (_selectedButton == "Inteligente") {
              acertouAResposta(1);
            } else {
              errouAResposta(1);
            }
            break;
          case 3:
            _selectedSpace3 = _selectedButton;
            if (_selectedButton == "Difícil") {
              acertouAResposta(2);
            } else {
              errouAResposta(2);
            }
            break;
          case 4:
            _selectedSpace4 = _selectedButton;
            if (_selectedButton == "Bonito") {
              acertouAResposta(3);
            } else {
              errouAResposta(3);
            }
            break;
        }
      });
      print('Espaço $spaceNumber preenchido com $_selectedButton!');
    } else {
      print('Selecione um adjetivo primeiro!');
    }
  }

  bool _canProceed() {
    // Verifica se exatamente quatro espaços foram preenchidos corretamente
    List<String?> selectedSpaces = [
      _selectedSpace1,
      _selectedSpace2,
      _selectedSpace3,
      _selectedSpace4,
    ];
    // Retorna true se exatamente quatro espaços estão preenchidos
    return selectedSpaces.where((space) => space != null).length == 4;
  }
}
