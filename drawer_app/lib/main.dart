import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePageDrawer(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          'Main UI',
          style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 221, 73, 14)),
        ),
      ),
      appBar: AppBar(
        title: const Center(child: Text("Drawer Home")),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text(
                "Main Drawer",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 221, 73, 14)),
              curve: Curves.bounceInOut,
            ),
            ListTile(
              title: const Text("Item 1"),
              onTap: () {
                const snackbar = SnackBar(
                  content: Text("Item 1"),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Item 2"),
              onTap: () {
                const snackbar = SnackBar(
                  content: Text("Item 2"),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
