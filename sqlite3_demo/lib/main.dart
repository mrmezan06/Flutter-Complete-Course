import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';



void main() {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  int? selectedId;

  final textController = TextEditingController();

  @override
  // 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sqflite DB')),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(  
                    border: OutlineInputBorder(),  
                    labelText: 'Fruit Name',  
                    hintText: 'A fruit name i.e, Banana',
                  ), 
                  textAlign: TextAlign.center, 
                controller: textController,
              ),
              TextButton.icon(
                onPressed: () async {
                  selectedId != null
                  ? await DatabaseHelper.instance.update(
                Grocery(id: selectedId, name: textController.text),
              )
              : await DatabaseHelper.instance.add(
                Grocery(name: textController.text),
              );
              setState(() {
                textController.clear();
                selectedId = null;
              }); 
            },
               icon: const Icon(Icons.save), label: const Text('Save')),
              // Main Data View
              Center(
                      child: FutureBuilder<List<Grocery>>(
                future: DatabaseHelper.instance.getGroceries(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Grocery>> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: Text('Loading...'));
                  }
                  return snapshot.data!.isEmpty
                      ? const Center(child: Text('No Fruits in List.'))
                      : ListView(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                                      children: snapshot.data!.map((grocery) {
                      return Center(
                        child: Card(
                          color: selectedId == grocery.id
                                    ? Colors.white70
                                    : Colors.white,
                          child: ListTile(
                            title: Text(grocery.name),
                            onTap: () {
                                    setState(() {
                                      if (selectedId == null) {
                                          textController.text = grocery.name;
                                          selectedId = grocery.id;
                                        } else {
                                          textController.text = '';
                                          selectedId = null;                              
                                        }
                                    });
                                  },
                            onLongPress: () {
                                    setState(() {
                                      DatabaseHelper.instance.remove(grocery.id!);
                                    });
                                  },
                          ),
                        ),
                      );
                                      }).toList(),
                                    );
                }),
                    ), 
            ],
          ),
          ),
      ),
    );
  }
}


class Grocery {
  final int? id;
  final String name;

  Grocery({this.id, required this.name});

  factory Grocery.fromMap(Map<String, dynamic> json) =>  Grocery(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'groceries.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
      await db.execute('''
        CREATE TABLE groceries(
            id INTEGER PRIMARY KEY,
            name TEXT
        )
        ''');
    }

    Future<List<Grocery>> getGroceries() async {
    Database db = await instance.database;
    var groceries = await db.query('groceries', orderBy: 'name');
    List<Grocery> groceryList = groceries.isNotEmpty
        ? groceries.map((c) => Grocery.fromMap(c)).toList()
        : [];
    return groceryList;
  }

  Future<int> add(Grocery grocery) async {
    Database db = await instance.database;
    return await db.insert('groceries', grocery.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('groceries', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Grocery grocery) async {
    Database db = await instance.database;
    return await db.update('groceries', grocery.toMap(),
        where: "id = ?", whereArgs: [grocery.id]);
  }

}