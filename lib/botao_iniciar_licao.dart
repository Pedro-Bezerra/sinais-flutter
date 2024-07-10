import 'package:flutter/material.dart';

class BotaoIniciarLicao extends StatelessWidget {
  final int number;
  final String legenda;
  final Widget? proximaPagina;

  const BotaoIniciarLicao(
      {Key? key,
      required this.number,
      required this.legenda,
      this.proximaPagina})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.2,
          height: MediaQuery.sizeOf(context).height * 0.15,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => proximaPagina!));
            },
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(
                side: BorderSide(
                  color: Color.fromARGB(255, 5, 74, 145),
                  width: 12.0,
                ),
              ),
              padding: EdgeInsets.all(35),
            ),
            child: Text(
              '$number',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
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
