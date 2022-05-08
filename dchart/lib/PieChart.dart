import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class PieChart extends StatelessWidget {
  const PieChart({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(title: const Center(child: Text('Bar Chart'))),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            ListTile(
              title: const Text('Pie Chart'),
              tileColor: Colors.purple[200],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartPie(
                  data: const [
                    {'domain': 'Flutter', 'measure': 28},
                    {'domain': 'React Native', 'measure': 27},
                    {'domain': 'Ionic', 'measure': 20},
                    {'domain': 'Cordova', 'measure': 15},
                  ],
                  fillColor: (pieData, index) => Colors.purple,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartPie(
                  data: const [
                    {'domain': 'Flutter', 'measure': 28},
                    {'domain': 'React Native', 'measure': 27},
                    {'domain': 'Ionic', 'measure': 20},
                    {'domain': 'Cordova', 'measure': 15},
                  ],
                  fillColor: (pieData, index) {
                    switch (pieData['domain']) {
                      case 'Flutter':
                        return Colors.blue;
                      case 'React Native':
                        return Colors.blueAccent;
                      case 'Ionic':
                        return Colors.lightBlue;
                      default:
                        return Colors.orange;
                    }
                  },
                  pieLabel: (pieData, index) {
                    return "${pieData['domain']}:\n${pieData['measure']}%";
                  },
                  labelPosition: PieLabelPosition.outside,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartPie(
                  data: const [
                    {'domain': 'Flutter', 'measure': 28},
                    {'domain': 'React Native', 'measure': 27},
                    {'domain': 'Ionic', 'measure': 20},
                    {'domain': 'Cordova', 'measure': 15},
                  ],
                  fillColor: (pieData, index) {
                    switch (pieData['domain']) {
                      case 'Flutter':
                        return Colors.purple.shade300;
                      case 'React Native':
                        return Colors.purple.shade500;
                      case 'Ionic':
                        return Colors.purple.shade700;
                      default:
                        return Colors.purple.shade900;
                    }
                  },
                  pieLabel: (pieData, index) {
                    return "${pieData['measure']}%";
                  },
                  labelPosition: PieLabelPosition.auto,
                  labelColor: Colors.white,
                  labelFontSize: 14,
                  labelLineColor: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartPie(
                  data: const [
                    {'domain': 'Flutter', 'measure': 28},
                    {'domain': 'React Native', 'measure': 27},
                    {'domain': 'Ionic', 'measure': 20},
                    {'domain': 'Cordova', 'measure': 15},
                  ],
                  fillColor: (pieData, index) {
                    switch (pieData['domain']) {
                      case 'Flutter':
                        return Colors.purple.shade300;
                      case 'React Native':
                        return Colors.purple.shade500;
                      case 'Ionic':
                        return Colors.purple.shade700;
                      default:
                        return Colors.purple.shade900;
                    }
                  },
                  pieLabel: (pieData, index) {
                    return "${pieData['measure']}%";
                  },
                  labelPosition: PieLabelPosition.outside,
                  labelColor: Colors.deepPurple,
                  labelFontSize: 14,
                  labelLineColor: Colors.purple.shade200,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Stack(
                  children: [
                    DChartPie(
                      data: const [
                        {'domain': 'Flutter', 'measure': 28},
                        {'domain': 'React Native', 'measure': 27},
                        {'domain': 'Ionic', 'measure': 20},
                        {'domain': 'Cordova', 'measure': 15},
                      ],
                      fillColor: (pieData, index) => Colors.purple,
                      donutWidth: 30,
                      labelColor: Colors.white,
                    ),
                    const Align(child: Text('Framework')),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartPie(
                  data: const [
                    {'domain': 'Flutter', 'measure': 28},
                    {'domain': 'React Native', 'measure': 27},
                    {'domain': 'Ionic', 'measure': 20},
                    {'domain': 'Cordova', 'measure': 15},
                  ],
                  fillColor: (pieData, index) {
                    switch (pieData['domain']) {
                      case 'Flutter':
                        return Colors.blue;
                      case 'React Native':
                        return Colors.blueAccent;
                      case 'Ionic':
                        return Colors.lightBlue;
                      default:
                        return Colors.orange;
                    }
                  },
                  pieLabel: (pieData, index) {
                    return "${pieData['domain']}:\n${pieData['measure']}%";
                  },
                  labelPosition: PieLabelPosition.outside,
                  donutWidth: 20,
                ),
              ),
            ),
        
              ]),
        ),
    ));
  }
}