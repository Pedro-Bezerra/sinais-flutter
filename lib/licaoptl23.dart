import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sinais_mobile/progresso.dart';
import 'custom_next_button.dart';
import 'widgetprogresso.dart'; // Certifique-se de importar o WidgetProgresso aqui também

class LicaoPTL23 extends StatefulWidget {
  @override
  _LicaoPTL23State createState() => _LicaoPTL23State();
}

class _LicaoPTL23State extends State<LicaoPTL23> {
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
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false);
            },
          ),
        ],
      ),
      backgroundColor: Color(0xFFD9D9D9),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            WidgetProgresso(count: 5), // Certifique-se de que o count está correto aqui
            SizedBox(height: 20),
            Expanded(
              flex: 3,
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
            ),
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
            CustomNextButton(
              label: 'Próximo',
              onPressed: _canProceed() ? _navigateToLicaoPTL24 : null,
              isEnabled: _canProceed(),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToLicaoPTL24() {
    Provider.of<ProgressManager>(context, listen: false).nextStep();
    Navigator.pushNamed(context, '/licaoPTL24');
  }

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
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
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
