import 'package:flutter/material.dart';
import 'custom_next_button.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
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
              SizedBox(height: 20),
              Text(
                'Escolha o sinal que representa a palavra',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildImageButton('Botão 1', imageSize),
                      SizedBox(width: 20),
                      _buildImageButton('Botão 2', imageSize),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildImageButton('Botão 3', imageSize),
                      SizedBox(width: 20),
                      _buildImageButton('Botão 4', imageSize),
                    ],
                  ),
                ],
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
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageButton(String buttonName, double imageSize) {
    bool isSelected = _selectedButton == buttonName;

    return GestureDetector(
      onTap: () {
        _handleButtonClick(buttonName);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.transparent,
            width: 4,
          ),
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
  final bool isSelected;

  const ImageButton({
    Key? key,
    required this.onPressed,
    required this.image,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.transparent,
            width: 4,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: image,
      ),
    );
  }
}
