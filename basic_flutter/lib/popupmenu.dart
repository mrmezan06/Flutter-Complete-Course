import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopUpMenuWidget extends StatefulWidget {
  const PopUpMenuWidget({Key? key}) : super(key: key);

  @override
  _PopUpMenuWidgetState createState() => _PopUpMenuWidgetState();
}

class _PopUpMenuWidgetState extends State<PopUpMenuWidget> {

  String title = 'First Page', firstPage = 'First Page', secondPage = 'Second Page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopUpMenu- $title'),
        actions: [
          PopupMenuButton(itemBuilder: (context) => [
            PopupMenuItem(child: Text(firstPage), value: firstPage,),
            PopupMenuItem(child: Text(secondPage), value: secondPage,),
          ],
          onSelected: (String newValue){
            setState(() {
              title = newValue;
            });
          },
          )
        ],

      ),

    );
  }
}
