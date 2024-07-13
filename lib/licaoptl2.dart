import 'package:flutter/material.dart';
import 'custom_next_button.dart'; // Importar o arquivo onde está o CustomNextButton

class LicaoPTL2 extends StatefulWidget {
  @override
  _LicaoPTL2State createState() => _LicaoPTL2State();
}

class _LicaoPTL2State extends State<LicaoPTL2> {
  String? _selectedButton;

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: NetworkImage(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
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
            _buildButton(context, 'Cachorro'),
            SizedBox(height: 10),
            _buildButton(context, 'Coruja'),
            SizedBox(height: 10),
            _buildButton(context, 'Tartaruga'),
            SizedBox(height: 20),
            CustomNextButton(
              label: 'Próximo',
              onPressed: _selectedButton != null
                  ? () {
                      Navigator.pushNamed(context, '/licaoPTL22');
                    }
                  : () {},
              isEnabled: _selectedButton != null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String buttonLabel) {
    bool isSelected = _selectedButton == buttonLabel;

    return ElevatedButton(
      onPressed: () {
        _handleButtonClick(context, buttonLabel);
      },
      child: Text(
        buttonLabel,
        style: TextStyle(color: isSelected ? Colors.white : Colors.black),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: Size(double.infinity, 50),
        backgroundColor: isSelected ? Color(0xFF054A91) : Colors.grey,
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
