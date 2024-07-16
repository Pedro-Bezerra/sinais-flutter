import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'progresso.dart';

class WidgetProgresso extends StatelessWidget {
  final int count;

  WidgetProgresso({required this.count});

  @override
  Widget build(BuildContext context) {
    int activeIndex = Provider.of<ProgressManager>(context).currentStep;

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(count, (index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            width: 20.0,
            height: 20.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index <= activeIndex ? Color(0xFF054A91) : Colors.grey,
            ),
          );
        }),
      ),
    );
  }
}
