import 'package:flutter/material.dart';

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
            ElevatedButton(
              onPressed: () {
                _handleButtonClick(context, 'Botão 1');
              },
              child: Text(
                'Cachorro',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _handleButtonClick(context, 'Botão 2');
              },
              child: Text(
                'Coruja',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _handleButtonClick(context, 'Botão 3');
              },
              child: Text(
                'Tartaruga',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: _selectedButton != null
                    ? () {
                        Navigator.pushNamed(context, '/licaoPTL22');
                      }
                    : null,
                child: Text(
                  'Próximo',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: _selectedButton != null
                      ? Color(0xFF054A91)
                      : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
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
