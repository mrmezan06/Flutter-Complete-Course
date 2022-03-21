import 'package:flutter/material.dart';

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({Key? key}) : super(key: key);

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page View'),
      ),
      body: PageView(
        children: [
          Container(
            color: Colors.blue,
            child: const Center(
              child: Text('Page 1',
              style: TextStyle(color: Colors.white, fontSize: 60),
              ),
            ),
          ),
          Container(
            color: Colors.orange,
            child: const Center(
              child: Text('Page 2',
                style: TextStyle(color: Colors.white, fontSize: 60),
              ),
            ),
          ),
          Container(
            color: Colors.red,
            child: const Center(
              child: Text('Page 3',
                style: TextStyle(color: Colors.white, fontSize: 60),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
