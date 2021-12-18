import 'dart:math';

import 'package:flutter/material.dart';

class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index = 0;
  List quotes = [
    "Life isn’t about getting and having, it’s about giving and being.",
    "Whatever the mind of man can conceive and believe, it can achieve.",
    "Strive not to be a success, but rather to be of value.",
    "You miss 100% of the shots you don’t take.",
    "I’ve missed more than 9000 shots in my career. I’ve lost almost 300 games. "
        "26 times I’ve been trusted to take the game winning shot and missed."
        " I’ve failed over and over and over again in my life. "
        "And that is why I succeed.",
    "The most difficult thing is the decision to act, the rest is merely tenacity.",
    "Every strike brings me closer to the next home run.",
    "Definiteness of purpose is the starting point of all achievement.",
    "We become what we think about.",
    "Life is 10% what happens to me and 90% of how I react to it.",
    "Your time is limited, so don’t waste it living someone else’s life."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Container(
                  width: 350,
                  height: 200,
                  margin: const EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14.5)),
                  child: Center(
                      child: Text(
                    quotes[_index],
                    style: TextStyle(color: Colors.grey.shade600, fontStyle: FontStyle.italic, fontSize: 16.5),
                  )),
                ),
              ),
            ),
            const Divider(thickness: 1.3),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: TextButton(
                onPressed: _showQuote,
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    fixedSize: const Size.fromWidth(140)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.wb_sunny,
                      color: Colors.white,
                    ),
                    Text(
                      "Inspire me!",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  void _showQuote() {
    setState(() {
      /*
      _index += 1;
      if(quotes.length == _index){
        _index = 0;
      }
      */

      /*
      * Randomized the quotes
      * */
      var randm = Random();
      var id = randm.nextInt(quotes.length);
      _index = id.toInt();
      // debugPrint("$_index");
    });
  }
}
