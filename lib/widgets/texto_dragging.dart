import 'package:flutter/material.dart';

class TextoDragAndDrop extends StatefulWidget {
  final String resposta;
  final String ordem;
  final ValueChanged<String> onTextDropped;
  final List<String> droppedTexts;
  final List<bool> occupiedTargets; // New list to track occupied targets
  final int index; // Index to identify this target
  final ValueChanged<bool> onRedBorderChanged; // Callback for red border changes

  TextoDragAndDrop({
    required this.resposta,
    required this.ordem,
    required this.onTextDropped,
    required this.droppedTexts,
    required this.occupiedTargets, // Pass the occupiedTargets list
    required this.index, // Pass the index of this target
    required this.onRedBorderChanged, // Pass the callback for red border changes
  });

  @override
  _TextoDragAndDropState createState() => _TextoDragAndDropState();
}

class _TextoDragAndDropState extends State<TextoDragAndDrop> {
  String _droppedText = '';
  bool hasRedBorder = false; 

  void _onAcceptWithDetails(DragTargetDetails<String> details) {
    // Check if this target is already occupied
    if (!widget.droppedTexts.contains(details.data) &&
        !widget.occupiedTargets[widget.index]) {
      setState(() {
        _droppedText = details.data;
        widget.droppedTexts.add(details.data);
        widget.occupiedTargets[widget.index] = true; // Mark this target as occupied
      });
      widget.onTextDropped(details.data);
      _updateBorderColor(); // Update border color after accepting text
    }
  }

  void _updateBorderColor() {
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
      hasRedBorder = false;
    } else if (errado && _droppedText.isNotEmpty) {
      hasRedBorder = true;
    } else {
      hasRedBorder = false;
    }

    // Ensure the state change happens outside the build method
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onRedBorderChanged(hasRedBorder);
    });
  }

  Color _determineBorderColor() {
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
      return Colors.green;
    } else if (errado && _droppedText.isNotEmpty) {
      return Colors.red;
    } else {
      return Color.fromARGB(75, 150, 150, 150);
    }
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor = _determineBorderColor(); // Get the border color once

    return Column(
      children: <Widget>[
        DragTarget<String>(
          onAcceptWithDetails: _onAcceptWithDetails,
          builder: (BuildContext context, List<dynamic> accepted, List<dynamic> rejected) {
            return Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: borderColor, // Use the determined border color
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
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
              style: TextStyle(fontSize: 20, color: Colors.black.withOpacity(0.7)),
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
