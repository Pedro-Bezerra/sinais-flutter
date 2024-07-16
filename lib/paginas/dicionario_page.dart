import 'package:flutter/material.dart';

class DicionarioPage extends StatelessWidget {
  const DicionarioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        color: Color.fromARGB(255, 237, 228, 222),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Meu dicionário",
              style: TextStyle(fontSize: 24),
            ),
            ToggleButtonDict(),
            Container(
              width: MediaQuery.sizeOf(context).width * 0.6,
              height: MediaQuery.sizeOf(context).height * 0.3,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Color(0xFF054A91),
                ),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 0.6,
              height: MediaQuery.sizeOf(context).height * 0.3,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Color(0xFF054A91),
                ),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ToggleButtonDict extends StatefulWidget {
  const ToggleButtonDict({super.key});

  @override
  State<ToggleButtonDict> createState() => _ToggleButtonDictState();
}

class _ToggleButtonDictState extends State<ToggleButtonDict> {
  List<bool> isSelected = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 237, 228, 222),
      ),
      child: ToggleButtons(
        selectedColor: Colors.black,
        color: Colors.black,
        fillColor: Color.fromARGB(255, 237, 228, 222),
        renderBorder: false,
        isSelected: isSelected,
        onPressed: (int index) {
          setState(() {
            for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
              isSelected[buttonIndex] = buttonIndex == index;
            }
          });
        },
        children: [
          _buildToggleButton("Sinais", isSelected[0]),
          _buildToggleButton("Frases", isSelected[1]),
          _buildToggleButton("Palavras", isSelected[2]),
        ],
      ),
    );
  }

  Widget _buildToggleButton(String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
      decoration: isSelected
          ? BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFF054A91),
                  width: 2.0,
                ),
              ),
            )
          : null,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: isSelected ? Colors.black : Colors.black,
        ),
      ),
    );
  }
}
