import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'custom_next_button.dart';
import 'widgetprogresso.dart';
import 'progresso.dart';

class LicaoPTL22 extends StatefulWidget {
  @override
  _LicaoPTL22State createState() => _LicaoPTL22State();
}

class _LicaoPTL22State extends State<LicaoPTL22> {
  String? _selectedImage;
  bool _buttonsDisabled = false;

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
        child: Container(
          padding: const EdgeInsets.all(16.0),
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              WidgetProgresso(count: 5),
              SizedBox(height: 20),
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
                      _buildImageButton('Imagem 1', 'https://img.freepik.com/vetores-premium/ilustracao-vetorial-de-estilo-de-desenho-a-lapis_484148-216.jpg', imageSize),
                      SizedBox(width: 20),
                      _buildImageButton('Imagem 2', 'https://www.artcamargo.com.br/media/catalog/product/cache/1/image/1000x1000/9df78eab33525d08d6e5fb8d27136e95/c/a/caderno-para-desenhar-canson-laranja-artcamargo-140g.png', imageSize),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildImageButton('Imagem 3', 'https://gartic.com.br/imgs/mural/an/andarilho/1250252799.gif', imageSize),
                      SizedBox(width: 20),
                      _buildImageButton('Imagem 4', 'https://medibangpaint.com/wp-content/uploads/2021/12/43-3.png', imageSize),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              CustomNextButton(
                label: 'Próximo',
                onPressed: _selectedImage != null && !_buttonsDisabled
                    ? () {
                        Provider.of<ProgressManager>(context, listen: false).nextStep();
                        setState(() {
                          _buttonsDisabled = true;
                        });
                        Navigator.pushNamed(context, '/licaoPTL23');
                      }
                    : null,
                isEnabled: _selectedImage != null && !_buttonsDisabled,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageButton(String buttonName, String imageUrl, double imageSize) {
    bool isSelected = _selectedImage == buttonName;
    Color corDaBorda;

    if (!isSelected) {
      corDaBorda = Colors.transparent;
    } else if (isSelected && buttonName == "Imagem 2") {
      corDaBorda = Colors.green;
    } else {
      corDaBorda = Colors.red;
    }


  void mudarCor() {
    setState(() {
      corDaBorda = buttonName == "Imagem 2" ? Colors.green : Colors.red;
    });
  }

    return GestureDetector(
      onTap: _buttonsDisabled || isSelected ? null : () {
        _handleImageSelect(buttonName);
        mudarCor();
        print("$corDaBorda");
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: corDaBorda,
            width: 4,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            imageUrl,
            width: imageSize,
            height: imageSize,
          ),
        ),
      ),
    );
  }

  void _handleImageSelect(String imageName) {
    setState(() {
      _selectedImage = imageName;
      _buttonsDisabled = false; 
    });
    print('Imagem $imageName selecionada!');
  }
}
