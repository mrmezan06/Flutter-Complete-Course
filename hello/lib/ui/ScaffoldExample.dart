import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hello/ui/CustomButton.dart';

class ScaffoldExample extends StatelessWidget {
  _tapButton() => {debugPrint("Again Tapped!")};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scaffold"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent.shade400,
        actions: [
          IconButton(
              onPressed: () => debugPrint("Email Tapped!"),
              icon: const Icon(Icons.email)),
          IconButton(
              onPressed: () => _tapButton(),
              icon: const Icon(Icons.access_alarm))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => debugPrint("Floating button pressed!"),
        backgroundColor: Colors.lightGreen,
        child: const Icon(Icons.call_missed),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: ("First")),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: ("Second")),
          BottomNavigationBarItem(icon: Icon(Icons.access_alarm), label: ("Alarm")),

          /*
          * Minimum BottomNavigationBarItem is 2
          * */
        ],
        onTap: (int index) => {
          debugPrint("Tapped item: $index")
        },
      ),
      backgroundColor: Colors.redAccent.shade400,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton()
            /*InkWell(
              child: const Text(
                "Tap me!",
                style: TextStyle(
                    fontSize: 23.4,
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
              ),
              onTap: () => debugPrint("Tapped...."),
            )*/
          ],
        ),
      ),
    );
  }
}
