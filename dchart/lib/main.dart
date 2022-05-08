import 'package:dchart/LineChart.dart';
import 'package:dchart/PieChart.dart';
import 'package:flutter/material.dart';
import 'package:dchart/barChart.dart';

import 'GaugeChart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('D Chart')),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Colors.deepPurple[200],
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BarChart()),
                    );
                  },
                  icon: const Icon(
                    Icons.bar_chart,
                    size: 64,
                    color: Colors.pinkAccent,
                  ),
                  label: const Text(
                    'Bar Chart',
                    style: TextStyle(color: Colors.pinkAccent),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LineChart()),
                    );
                  },
                  icon: const Icon(
                    Icons.stacked_line_chart,
                    size: 64,
                    color: Colors.deepPurple,
                  ),
                  label: const Text('Line Chart',
                      style: TextStyle(color: Colors.deepPurple)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PieChart()),
                    );
                  },
                  icon: const Icon(
                    Icons.pie_chart,
                    size: 64,
                    color: Colors.redAccent,
                  ),
                  label: const Text('Pie Chart',
                      style: TextStyle(color: Colors.redAccent)),
                ),
                TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const GaugeChart()),
                    );
                  },
                  icon: const Icon(
                    Icons.stacked_line_chart_sharp,
                    size: 64,
                    color: Colors.amber,
                  ),
                  label: const Text('Gauge Chart',
                      style: TextStyle(color: Colors.amber)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BarChart()),
                    );
                  },
                  icon: const Icon(
                    Icons.bar_chart,
                    size: 64,
                    color: Color.fromARGB(255, 71, 242, 80),
                  ),
                  label: const Text('Bar Chart Complex',
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(color: Color.fromARGB(255, 71, 242, 80))),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LineChart()),
                    );
                  },
                  icon: const Icon(
                    Icons.stacked_line_chart_outlined,
                    size: 64,
                  ),
                  label: const Text(
                    'Line Chart Complex',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
