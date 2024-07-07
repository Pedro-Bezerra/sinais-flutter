import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    double imageSize = MediaQuery.of(context).size.width * 0.35;

    return Scaffold(
      appBar: AppBar(
        title: Text('Complete com Substantivos'),
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
            Text(
              'Escreva o substantivo que corresponde à imagem',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: [
                          Image.network(
                            'https://m.media-amazon.com/images/I/61xLyYajSXL._AC_UF894,1000_QL80_.jpg',
                            width: imageSize,
                            height: imageSize,
                          ),
                          SizedBox(height: 10),
                          _buildTextField(_controller1, ''),
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          Image.network(
                            'https://img.kalunga.com.br/fotosdeprodutos/176072z_2.jpg',
                            width: imageSize,
                            height: imageSize,
                          ),
                          SizedBox(height: 10),
                          _buildTextField(_controller2, ''),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: [
                          Image.network(
                            'https://www.papelariaartnova.com.br/img/products/caderno-espiral-univ-capa-dura-16x1-256-fls-zip-preto-tilibra-340821_1_600.jpg',
                            width: imageSize,
                            height: imageSize,
                          ),
                          SizedBox(height: 10),
                          _buildTextField(_controller3, ''),
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          Image.network(
                            'https://cdnv2.moovin.com.br/marbig/imagens/produtos/det/regua-em-poliestireno-15cm-academie-img-150497_2805241429046215.jpg',
                            width: imageSize,
                            height: imageSize,
                          ),
                          SizedBox(height: 10),
                          _buildTextField(_controller4, ''),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: _canProceed()
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
                  backgroundColor: _canProceed()
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

  Widget _buildTextField(TextEditingController controller, String hintText) {
    return Container(
      width: 200,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(),
        ),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z]+$')),
        ],
        onChanged: (text) {
          setState(() {});
        },
      ),
    );
  }

  bool _canProceed() {
    return _controller1.text.isNotEmpty &&
        _controller2.text.isNotEmpty &&
        _controller3.text.isNotEmpty &&
        _controller4.text.isNotEmpty;
  }
}
