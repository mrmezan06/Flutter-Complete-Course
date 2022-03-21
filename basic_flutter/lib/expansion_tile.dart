import 'package:flutter/material.dart';

class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expansion Tile'),
      ),
      body: const ExpansionTile(
        leading: Icon(Icons.info_outline, color: Colors.deepOrange,),
        title: Text('See more', style: TextStyle(color: Colors.blue),),
        trailing: Icon(Icons.arrow_drop_down_sharp, color: Colors.green,),
        //iconColor: Colors.deepOrange,
        children: [
          ListTile(title: Text('First')),
          ListTile(title: Text('Second')),
          ListTile(title: Text('Third')),
          ListTile(title: Text('Fourth')),
        ],
      ),
    );
  }
}
