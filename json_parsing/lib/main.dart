import 'package:flutter/material.dart';
import 'package:json_parsing/json_parsing_map.dart';
import 'package:json_parsing/parsing%20json.dart';


// void main() {
//   runApp(
//       const MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: JsonParsingMap(),
//       )
//   );
// }

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Json Parsing';

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}