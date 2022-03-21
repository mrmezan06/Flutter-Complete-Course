import 'package:flutter/material.dart';

class AlertDialogWidget extends StatefulWidget {
  const AlertDialogWidget({Key? key}) : super(key: key);

  @override
  State<AlertDialogWidget> createState() => _AlertDialogWidgetState();
}

class _AlertDialogWidgetState extends State<AlertDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AlertDialog'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Show Alert Dialog'),
          onPressed: (){
            showDialog(context: context, builder: (context) =>AlertDialog(
              actions: [
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: const Text('Close'))
              ],
              title: const Text('Alert!'),
              contentPadding: const EdgeInsets.all(20.0),
              content: const Text('Here is the Dialog Box'),
            ),
            );
          },
        ),
      ),
    );
  }
}
