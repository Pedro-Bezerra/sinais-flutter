import 'package:flutter/material.dart';

class TextoDragAndDrop extends StatefulWidget {
  final String resposta;
  final String ordem;

  TextoDragAndDrop(this.resposta, this.ordem);

  @override
  _TextoDragAndDropState createState() => _TextoDragAndDropState(resposta, ordem);
}

class _TextoDragAndDropState extends State<TextoDragAndDrop> {
  String _droppedText = '';
  String resposta;
  String ordem;

  _TextoDragAndDropState(this.resposta, this.ordem);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DragTarget<String>(
          onAcceptWithDetails: (details) {
            setState(() {
              _droppedText = details.data;
            });
          },
          builder: (BuildContext context, List<dynamic> accepted,
              List<dynamic> rejected) {
            return Container(
              width: MediaQuery.sizeOf(context).width * 0.2,
              height: MediaQuery.sizeOf(context).height * 0.1,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Color.fromARGB(75, 150, 150, 150), // Border color
                  width: 1.0, // Border width
                ),
                borderRadius: BorderRadius.circular(15.0), // Border radius
              ),
              child: Center(
                child: Text(
                  _droppedText.isEmpty ? ordem : _droppedText,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            );
          },
        ),
        SizedBox(height: 10),
        Draggable<String>(
          data: resposta,
          child: Text(
            resposta,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          feedback: Material(
            color: Colors.transparent,
            child: Text(
              resposta,
              style:
                  TextStyle(fontSize: 20, color: Colors.black.withOpacity(0.7)),
            ),
          ),
          childWhenDragging: Text(
            resposta,
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
