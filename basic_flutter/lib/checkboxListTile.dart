import 'package:flutter/material.dart';

class CheckBoxListTileWidget extends StatefulWidget {
  const CheckBoxListTileWidget({Key? key}) : super(key: key);

  @override
  State<CheckBoxListTileWidget> createState() => _CheckBoxListTileWidgetState();
}

class _CheckBoxListTileWidgetState extends State<CheckBoxListTileWidget> {
  bool? _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CheckBox ListTile'),
      ),body: Center(
      child: CheckboxListTile(
        title: const Text('CheckBox List Tile'),
        value: _isChecked,
        onChanged: (bool? newValue){
          setState(() {
            _isChecked = newValue;
          });
        },
        activeColor: Colors.orangeAccent,
        checkColor: Colors.white,
        controlAffinity: ListTileControlAffinity.leading,
        tileColor: Colors.black12,
        tristate: true, // 3 option: no selection, yes selection, None of these
        subtitle: const Text('Subtitle'),
      ),
    ),
    );
  }
}
