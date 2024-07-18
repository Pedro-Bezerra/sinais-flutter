import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_prototipo/licoes/licao_ptl23.dart';
import 'package:teste_prototipo/paginas/inicio.dart';
import 'package:teste_prototipo/widgets/botao_proximo.dart';
import 'package:teste_prototipo/widgets/widget_progresso.dart';
import 'package:teste_prototipo/widgets/progresso.dart';

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
              MaterialPageRoute(
                builder: (context) => InicioPage(
                    usuario: "Vitinho", email: "vitor.farias@upe.br"),
              );
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
                    'CADERNO',
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
                      _buildImageButton(
                          'Imagem 1', 'assets/images/lapis.jpg', imageSize),
                      SizedBox(width: 20),
                      _buildImageButton(
                          'Imagem 2', 'assets/images/caderno.png', imageSize),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildImageButton(
                          'Imagem 3', 'assets/images/caneta.gif', imageSize),
                      SizedBox(width: 20),
                      _buildImageButton(
                          'Imagem 4', 'assets/images/cadeira.png', imageSize),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              BotaoNext(
                funcao: _selectedImage != null && _buttonsDisabled
                    ? () {
                        Provider.of<ProgressManager>(context, listen: false)
                          .nextStep();
                        
                      }
                    : null,
                proximaPagina: _selectedImage != null && _buttonsDisabled
                    ? LicaoPTL23()
                    : null,
                estaHabilitado: _selectedImage != null && _buttonsDisabled,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageButton(
      String buttonName, String imagePath, double imageSize) {
    bool isSelected = _selectedImage == buttonName;
    Color borderColor = Colors.transparent;

    if (isSelected) {
      borderColor = buttonName == "Imagem 2" ? Colors.green : Colors.red;
    }

    return GestureDetector(
      onTap: _buttonsDisabled
          ? null
          : () {
              _handleImageSelect(buttonName);
            },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: 4,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
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
      _buttonsDisabled = true; // Desabilita todos os botões após a seleção
    });
    print('Imagem $imageName selecionada!');
  }
}
