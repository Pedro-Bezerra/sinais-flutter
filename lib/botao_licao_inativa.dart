import 'package:flutter/material.dart';

class BotaoLicaoInativa extends StatelessWidget {
  final String legenda;

  const BotaoLicaoInativa(
      {Key? key, required this.legenda})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.18,
          height: MediaQuery.sizeOf(context).height * 0.15,
          child: ElevatedButton(
            onPressed: () {
              print('Button pressed');
            },
            style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                backgroundColor: Color.fromARGB(255, 203, 203, 203)),
            child: Center(
              child: Icon(
                Icons.lock,
                color: Color.fromARGB(255, 79, 79, 79),
                size: 50,
              ),
            ),
          ),
        ),
        Text(legenda,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w900, color: Colors.black))
      ],
    );
  }
}
