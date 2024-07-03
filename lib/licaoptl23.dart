import 'package:flutter/material.dart';

class LicaoPTL23 extends StatefulWidget {
  @override
  _LicaoPTL23State createState() => _LicaoPTL23State();
}

class _LicaoPTL23State extends State<LicaoPTL23> {
  String? _selectedButton;
  String? _selectedImage;

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
                      GestureDetector(
                        onTap: () {
                          _handleImageClick('Imagem 1');
                        },
                        child: Image(
                          image: NetworkImage(
                              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                          width: imageSize,
                          height: imageSize,
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          _handleImageClick('Imagem 2');
                        },
                        child: Image(
                          image: NetworkImage(
                              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
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
                      GestureDetector(
                        onTap: () {
                          _handleImageClick('Imagem 3');
                        },
                        child: Image(
                          image: NetworkImage(
                              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                          width: imageSize,
                          height: imageSize,
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          _handleImageClick('Imagem 4');
                        },
                        child: Image(
                          image: NetworkImage(
                              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
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
            Text(
              'Ligue o verbo com a ação',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ImageButton(
                  onPressed: () {
                    _handleButtonClick('Botão 1');
                  },
                  label: 'Botão 1',
                ),
                SizedBox(width: 20),
                ImageButton(
                  onPressed: () {
                    _handleButtonClick('Botão 2');
                  },
                  label: 'Botão 2',
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
                  label: 'Botão 3',
                ),
                SizedBox(width: 20),
                ImageButton(
                  onPressed: () {
                    _handleButtonClick('Botão 4');
                  },
                  label: 'Botão 4',
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: _selectedButton != null && _selectedImage != null
                    ? () {
                        Navigator.pushNamed(context, '/home');
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
                  backgroundColor: _selectedButton != null && _selectedImage != null
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

  void _handleButtonClick(String buttonName) {
    setState(() {
      _selectedButton = buttonName;
    });
    print('Botão $buttonName clicado!');
  }

  void _handleImageClick(String imageName) {
    if (_selectedButton != null) {
      setState(() {
        _selectedImage = imageName;
      });
      print('Imagem $imageName clicada!');
      print('Relacionando $_selectedButton com $imageName');
      // Aqui você pode implementar a lógica para relacionar o botão selecionado com a imagem
    } else {
      print('Selecione um botão primeiro!');
    }
  }
}

class ImageButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const ImageButton({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF054A91),
        foregroundColor: Colors.white,
        minimumSize: Size(150, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
