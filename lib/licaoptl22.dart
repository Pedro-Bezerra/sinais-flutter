import 'package:flutter/material.dart';
import 'custom_next_button.dart'; // Importe o arquivo onde está o CustomNextButton

class LicaoPTL22 extends StatefulWidget {
  @override
  _LicaoPTL22State createState() => _LicaoPTL22State();
}

class _LicaoPTL22State extends State<LicaoPTL22> {
  String? _selectedButton;  

  @override
  Widget build(BuildContext context) {
    double imageSize = MediaQuery.of(context).size.width * 0.35;

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
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    'CORUJA',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Escolha o sinal que representa a palavra',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ImageButton(
                        onPressed: () {
                          _handleButtonClick('Botão 1');
                        },
                        image: Image.network(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                          width: imageSize,
                          height: imageSize,
                        ),
                      ),
                      SizedBox(width: 20),
                      ImageButton(
                        onPressed: () {
                          _handleButtonClick('Botão 2');
                        },
                        image: Image.network(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                          width: imageSize,
                          height: imageSize,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ImageButton(
                        onPressed: () {
                          _handleButtonClick('Botão 3');
                        },
                        image: Image.network(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                          width: imageSize,
                          height: imageSize,
                        ),
                      ),
                      SizedBox(width: 20),
                      ImageButton(
                        onPressed: () {
                          _handleButtonClick('Botão 4');
                        },
                        image: Image.network(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                          width: imageSize,
                          height: imageSize,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            CustomNextButton(
              label: 'Próximo',
              onPressed: _selectedButton != null
                  ? () {
                      Navigator.pushNamed(context, '/licaoPTL23');
                    }
                  : () {},
              isEnabled: _selectedButton != null,
            ),
          ],
        ),
      ),
    );
  }

  void _handleButtonClick(String buttonName) {
    setState(() {
      _selectedButton = buttonName;
    });
    print('Botão $buttonName clicado!');
  }
}

class ImageButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Image image;

  const ImageButton({
    Key? key,
    required this.onPressed,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: image,
    );
  }
}
