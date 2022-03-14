import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class MainUI extends StatefulWidget {
  const MainUI({Key? key}) : super(key: key);

  @override
  _MainUIState createState() => _MainUIState();
}

class _MainUIState extends State<MainUI> {
  List _items = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/unsplash_json (1).json');
    final data = await json.decode(response);
    setState(() {
      _items = data[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    readJson();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Wallpaper Store"),
        ),
        body: GridView.count(crossAxisCount: 2,
        children: List.generate(_items.length, (index){
              return Center(
                child: Text(
                  '$index',
                  style: Theme.of(context).textTheme.headline5,
                ),
              );
            }),
        ),
      ),
    );
  }
}
