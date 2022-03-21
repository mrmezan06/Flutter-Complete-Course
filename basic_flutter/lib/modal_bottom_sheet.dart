import 'package:flutter/material.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({Key? key}) : super(key: key);

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modal Bottom Sheet'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Modal BottomSheet'),
          onPressed: (){
            showModalBottomSheet(context: context, builder: (BuildContext context){
              return Container(
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.lightBlueAccent,
                ),
                child: Center(
                  child: ElevatedButton(
                    child: const Text('Close'),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
              );
            });
          },
        ),
      ),
    );
  }
}
