import 'package:flutter/material.dart';

double _volume = 0.0;
class MyIconButton extends StatefulWidget {
  const MyIconButton({Key? key}) : super(key: key);

  @override
  _MyIconButtonState createState() => _MyIconButtonState();
}

class _MyIconButtonState extends State<MyIconButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("AppBar", style: TextStyle(letterSpacing: 4, fontSize: 24, fontWeight: FontWeight.bold),)),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    _volume += 10;
                  });
                },
                icon: const Icon(Icons.volume_up),
              iconSize: 48,
              color: Colors.blue,
              focusColor: Colors.green,
              mouseCursor: MouseCursor.defer,
              hoverColor: Colors.deepOrangeAccent,
              tooltip: 'Increased volume by 10',
            ),
            const SizedBox(height: 15,),
            Text('Volume : $_volume'),
          ],
        ),
      ),
    );
  }
}
