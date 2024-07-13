import 'package:flutter/material.dart';

class LicaoPTL24 extends StatefulWidget {
  @override
  _LicaoPTL24State createState() => _LicaoPTL24State();
}

class _LicaoPTL24State extends State<LicaoPTL24> {
  String? _selectedButton;
  String? _selectedSpace1;
  String? _selectedSpace2;
  String? _selectedSpace3;
  String? _selectedSpace4;

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
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildSentence('A caneta é ', _selectedSpace1, () => _handleSpaceClick(1)),
                  SizedBox(height: 10),
                  _buildSentence('O professor é ', _selectedSpace2, () => _handleSpaceClick(2)),
                  SizedBox(height: 10),
                  _buildSentence('A matéria é ', _selectedSpace3, () => _handleSpaceClick(3)),
                  SizedBox(height: 10),
                  _buildSentence('O caderno é ', _selectedSpace4, () => _handleSpaceClick(4)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Complete a frase com o adjetivo correto',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildAdjectiveButton('Bonito'),
                SizedBox(width: 20),
                _buildAdjectiveButton('Difícil'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildAdjectiveButton('Inteligente'),
                SizedBox(width: 20),
                _buildAdjectiveButton('Azul'),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: _canProceed()
                    ? () {
                        Navigator.pushNamed(context, '/licaoPTL25');
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

  Widget _buildSentence(String text, String? selectedAdjective, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Text(
              selectedAdjective ?? '______',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdjectiveButton(String label) {
    return ElevatedButton(
      onPressed: () {
        _handleButtonClick(label);
      },
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

  void _handleButtonClick(String buttonLabel) {
    setState(() {
      _selectedButton = buttonLabel;
    });
    print('Botão $buttonLabel clicado!');
  }

  void _handleSpaceClick(int spaceNumber) {
    if (_selectedButton != null) {
      setState(() {
        switch (spaceNumber) {
          case 1:
            _selectedSpace1 = _selectedButton;
            break;
          case 2:
            _selectedSpace2 = _selectedButton;
            break;
          case 3:
            _selectedSpace3 = _selectedButton;
            break;
          case 4:
            _selectedSpace4 = _selectedButton;
            break;
        }
      });
      print('Espaço $spaceNumber preenchido com $_selectedButton!');
    } else {
      print('Selecione um adjetivo primeiro!');
    }
  }

  bool _canProceed() {
    List<String?> selectedSpaces = [
      _selectedSpace1,
      _selectedSpace2,
      _selectedSpace3,
      _selectedSpace4,
    ];
    return selectedSpaces.toSet().length == selectedSpaces.length &&
        selectedSpaces.every((element) => element != null);
  }
}
