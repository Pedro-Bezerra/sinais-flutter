import 'dart:math';

import 'package:flutter/material.dart';

class Flashcard extends StatefulWidget {
  final Widget front;
  final Widget back;

  const Flashcard({required this.front, required this.back, Key? key})
      : super(key: key);

  @override
  _FlashcardState createState() => _FlashcardState();
}

class _FlashcardState extends State<Flashcard> {
  bool _isFront = true;

  void _flipCard() {
    setState(() {
      _isFront = !_isFront;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    
    final double cardWidth = screenWidth * 0.8; 
    final double cardHeight = screenHeight * 0.5;

    return GestureDetector(
      onTap: _flipCard,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          final rotate = Tween(begin: pi, end: 0.0).animate(animation);
          return AnimatedBuilder(
            animation: rotate,
            child: child,
            builder: (BuildContext context, Widget? child) {
              final isUnder = ValueKey(_isFront) != child?.key;
              var tilt = (animation.value - 0.5).abs() - 0.5;
              tilt *= isUnder ? -0.003 : 0.003;
              final value = isUnder ? min(rotate.value, pi / 2) : rotate.value;
              return Transform(
                transform: Matrix4.rotationY(value)..setEntry(3, 0, tilt),
                child: child,
              );
            },
          );
        },
        layoutBuilder: (Widget? currentChild, List<Widget> previousChildren) {
          return Stack(
            children: <Widget>[
              ...previousChildren,
              if (currentChild != null) currentChild,
            ],
          );
        },
        child: _isFront
            ? Container(
                width: cardWidth,
                height: cardHeight,
                key: ValueKey(true),
                child: widget.front,
              )
            : Container(
                width: cardWidth,
                height: cardHeight,
                key: ValueKey(false),
                child: widget.back,
              ),
      ),
    );
  }
}
