import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'custom_next_button.dart';
import 'widgetprogresso.dart';
import 'progresso.dart';

class LicaoPTL25 extends StatefulWidget {
  @override
  _LicaoPTL25State createState() => _LicaoPTL25State();
}

class _LicaoPTL25State extends State<LicaoPTL25> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();

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
              Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
            },
          ),
        ],
      ),
      backgroundColor: Color(0xFFD9D9D9),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              WidgetProgresso(count: 5), // Widget de progresso com 4 bolas azuis
              SizedBox(height: 20),
              Text(
                'Escreva o substantivo que corresponde à imagem',
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
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _buildImageTextField(
                          'https://m.media-amazon.com/images/I/61xLyYajSXL._AC_UF894,1000_QL80_.jpg',
                          _controller1,
                        ),
                        SizedBox(height: 20),
                        _buildImageTextField(
                          'https://img.kalunga.com.br/fotosdeprodutos/176072z_2.jpg',
                          _controller2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _buildImageTextField(
                          'https://www.papelariaartnova.com.br/img/products/caderno-espiral-univ-capa-dura-16x1-256-fls-zip-preto-tilibra-340821_1_600.jpg',
                          _controller3,
                        ),
                        SizedBox(height: 20),
                        _buildImageTextField(
                          'https://cdnv2.moovin.com.br/marbig/imagens/produtos/det/regua-em-poliestireno-15cm-academie-img-150497_2805241429046215.jpg',
                          _controller4,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              CustomNextButton(
                label: 'Próximo',
                onPressed: _canProceed() ? () {
                  Navigator.pushNamed(context, '/telaDeResultado');
                } : null,
                isEnabled: _canProceed(),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageTextField(String imageUrl, TextEditingController controller) {
    double imageSize = MediaQuery.of(context).size.width * 0.35;

    return Column(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.0,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.white, // Fundo branco
            border: Border.all(color: Color(0xFF054A91)), // Cor da borda e traço
            borderRadius: BorderRadius.circular(8.0), // Borda arredondada
          ),
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: '',
              border: InputBorder.none, // Remove a borda padrão do TextField
            ),
            style: TextStyle(color: Color(0xFF054A91)), // Cor do texto da caixa de texto
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-ZáÁâÂãÃàÀéÉêÊíÍóÓôÔõÕúÚüÜçÇ\s]+')),
            ],
            onChanged: (text) {
              Provider.of<ProgressManager>(context, listen: false).nextStep();
            },
          ),
        ),
      ],
    );
  }

  bool _canProceed() {
    return Provider.of<ProgressManager>(context).currentStep >= 4;
  }
}
