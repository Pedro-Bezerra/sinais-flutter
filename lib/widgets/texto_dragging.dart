import 'package:flutter/material.dart';

class TextoDragAndDrop extends StatefulWidget {
  final String resposta;
  final String ordem;
  final ValueChanged<String> onTextDropped;
  final List<String> droppedTexts;
  final List<bool> occupiedTargets; // New list to track occupied targets
  final int index; // Index to identify this target

  TextoDragAndDrop({
    required this.resposta,
    required this.ordem,
    required this.onTextDropped,
    required this.droppedTexts,
    required this.occupiedTargets, // Pass the occupiedTargets list
    required this.index, // Pass the index of this target
  });

  @override
  _TextoDragAndDropState createState() => _TextoDragAndDropState();
}

class _TextoDragAndDropState extends State<TextoDragAndDrop> {
  String _droppedText = '';

  void _onAcceptWithDetails(DragTargetDetails<String> details) {
    // Check if this target is already occupied
    if (!widget.droppedTexts.contains(details.data) && !widget.occupiedTargets[widget.index]) {
      setState(() {
        _droppedText = details.data;
        widget.droppedTexts.add(details.data);
        widget.occupiedTargets[widget.index] = true; // Mark this target as occupied
      });
      widget.onTextDropped(details.data);
    }
  }

  BoxDecoration _getContainerDecoration() {
    Color borderColor;

    bool errado = (_droppedText != "A" && widget.ordem != "1") ||
        (_droppedText != "aluna" && widget.ordem != "2") ||
        (_droppedText != "respondeu" && widget.ordem != "3") ||
        (_droppedText != "a" && widget.ordem != "4") ||
        (_droppedText != "prova" && widget.ordem != "5");

    bool certo = (_droppedText == "A" && widget.ordem == "1") ||
        (_droppedText == "aluna" && widget.ordem == "2") ||
        (_droppedText == "respondeu" && widget.ordem == "3") ||
        (_droppedText == "a" && widget.ordem == "4") ||
        (_droppedText == "prova" && widget.ordem == "5");

    if (certo) {
      borderColor = Colors.green;
    } else if (errado && _droppedText != "") {
      borderColor = Colors.red;
    } else {
      borderColor = Color.fromARGB(75, 150, 150, 150);
    }

    return BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: borderColor, // Border color based on dropped text
        width: 1.0, // Border width
      ),
      borderRadius: BorderRadius.circular(8.0), // Border radius
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DragTarget<String>(
          onAcceptWithDetails: _onAcceptWithDetails,
          builder: (BuildContext context, List<dynamic> accepted,
              List<dynamic> rejected) {
            return Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: _getContainerDecoration(),
              child: Center(
                child: Text(
                  _droppedText.isEmpty ? widget.ordem : _droppedText,
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
            );
          },
        ),
        SizedBox(height: 10),
        Draggable<String>(
          data: widget.resposta,
          child: Text(
            widget.resposta,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          feedback: Material(
            color: Colors.transparent,
            child: Text(
              widget.resposta,
              style:
                  TextStyle(fontSize: 20, color: Colors.black.withOpacity(0.7)),
            ),
          ),
          childWhenDragging: Text(
            widget.resposta,
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
