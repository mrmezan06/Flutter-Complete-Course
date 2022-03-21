import 'package:flutter/material.dart';

class SelectTextWidget extends StatefulWidget {
  const SelectTextWidget({Key? key}) : super(key: key);

  @override
  State<SelectTextWidget> createState() => _SelectTextWidgetState();
}

class _SelectTextWidgetState extends State<SelectTextWidget> {
  String selectedText = '';
  final String _selectableText = 'This is a selectable text';
  final TextStyle _styleBlue = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.blue
  );
  final TextStyle _style = const TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selectable Text'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(selectedText, style: _styleBlue,),
              TextSelectionTheme(
                data: const TextSelectionThemeData(
                  selectionColor: Colors.yellow
                ),
                child: SelectableText(
                  _selectableText,
                  style: _style,
                  onSelectionChanged: (selection, cause){
                    setState(() {
                      selectedText = _selectableText.substring(
                        selection.start, selection.end
                      );
                    });
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}
