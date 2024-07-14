import 'package:flutter/material.dart';

class ConteudoConectar extends StatefulWidget {
  final Widget child;
  final Function onClick;
  final bool isSelected;

  ConteudoConectar({
    Key? key,
    required this.child,
    required this.onClick,
    required this.isSelected,
  }) : super(key: key);

  @override
  _ConteudoConectarState createState() => _ConteudoConectarState();
}

class _ConteudoConectarState extends State<ConteudoConectar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onClick();
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.isSelected
                ? Color.fromARGB(255, 5, 74, 145)
                : Colors.transparent,
            width: 2.0,
          ),
        ),
        child: widget.child,
      ),
    );
  }
}
