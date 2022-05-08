import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class GaugeChart extends StatelessWidget {
  const GaugeChart({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(title: const Center(child: Text('Bar Chart'))),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            ListTile(
              title: const Text('Gauge Chart'),
              tileColor: Colors.blue[200],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartGauge(
                  data: const [
                    {'domain': 'Flutter', 'measure': 28},
                    {'domain': 'React Native', 'measure': 27},
                    {'domain': 'Ionic', 'measure': 20},
                    {'domain': 'Cordova', 'measure': 15},
                  ],
                  fillColor: (pieData, index) => Colors.blue,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartGauge(
                  data: const [
                    {'domain': 'Off', 'measure': 30},
                    {'domain': 'Warm', 'measure': 30},
                    {'domain': 'Hot', 'measure': 30},
                  ],
                  fillColor: (pieData, index) {
                    switch (pieData['domain']) {
                      case 'Off':
                        return Colors.green;
                      case 'Warm':
                        return Colors.orange;
                      default:
                        return Colors.red;
                    }
                  },
                  showLabelLine: false,
                  pieLabel: (pieData, index) {
                    return "${pieData['domain']}";
                  },
                  labelPosition: PieLabelPosition.inside,
                  labelPadding: 0,
                  labelColor: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Stack(
                  children: [
                    DChartGauge(
                      data: const [
                        {'domain': 'OFF', 'measure': 1},
                        {'domain': 'N', 'measure': 1},
                        {'domain': '1', 'measure': 1},
                        {'domain': '2', 'measure': 1},
                        {'domain': '3', 'measure': 1},
                        {'domain': '4', 'measure': 1},
                        {'domain': '5', 'measure': 1},
                      ],
                      fillColor: (pieData, index) {
                        switch (pieData['domain']) {
                          case 'Off':
                            return Colors.grey.shade700;
                          case 'N':
                            return Colors.green.shade900;
                          case '3':
                            return Colors.orangeAccent;
                          default:
                            return Colors.grey[300];
                        }
                      },
                      showLabelLine: false,
                      pieLabel: (pieData, index) {
                        return "${pieData['domain']}";
                      },
                      labelPosition: PieLabelPosition.inside,
                      labelPadding: 0,
                      labelColor: Colors.white,
                    ),
                    const Align(child: Text('Gassss')),
                    ],
                )
                )
                )
              ]),
        ),
    ));
  }
}