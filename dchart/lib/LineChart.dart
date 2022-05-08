import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class LineChart extends StatelessWidget {
  const LineChart({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(title: const Center(child: Text('Bar Chart'))),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            ListTile(
              title: const Text('Line Chart'),
              tileColor: Colors.amber[200],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartLine(
                  data: const [
                    {
                      'id': 'Line',
                      'data': [
                        {'domain': 0, 'measure': 4.1},
                        {'domain': 2, 'measure': 4},
                        {'domain': 3, 'measure': 6},
                        {'domain': 4, 'measure': 1},
                      ],
                    },
                  ],
                  lineColor: (lineData, index, id) => Colors.amber,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartLine(
                  data: const [
                    {
                      'id': 'Line',
                      'data': [
                        {'domain': 0, 'measure': 2.5},
                        {'domain': 2, 'measure': 4},
                        {'domain': 3, 'measure': 6},
                        {'domain': 4, 'measure': 1},
                      ],
                    },
                  ],
                  includePoints: true,
                  lineColor: (lineData, index, id) => Colors.amber,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const RotatedBox(quarterTurns: 3, child: Text('Quantity')),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: DChartLine(
                            lineColor: (lineData, index, id) {
                              return id == 'Line 1'
                                  ? Colors.blue
                                  : Colors.amber;
                            },
                            data: const [
                              {
                                'id': 'Line 1',
                                'data': [
                                  {'domain': 1, 'measure': 3},
                                  {'domain': 2, 'measure': 3},
                                  {'domain': 3, 'measure': 4},
                                  {'domain': 4, 'measure': 6},
                                  {'domain': 5, 'measure': 0.3},
                                ],
                              },
                              {
                                'id': 'Line 2',
                                'data': [
                                  {'domain': 1, 'measure': 4},
                                  {'domain': 2, 'measure': 5},
                                  {'domain': 3, 'measure': 2},
                                  {'domain': 4, 'measure': 1},
                                  {'domain': 5, 'measure': 2.5},
                                ],
                              },
                            ],
                            includePoints: true,
                          ),
                        ),
                        Text('Day'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartLine(
                  lineColor: (lineData, index, id) {
                    return id == 'Line 1'
                        ? Colors.blue
                        : id == 'Line 2'
                            ? Colors.amber
                            : Colors.green;
                  },
                  pointColor: (lineData, index, id) {
                    return id == 'Line 1'
                        ? Colors.blue.shade900
                        : id == 'Line 2'
                            ? Colors.amber.shade900
                            : Colors.green.shade900;
                  },
                  data: const [
                    {
                      'id': 'Line 1',
                      'data': [
                        {'domain': 0, 'measure': 0.5},
                        {'domain': 2, 'measure': 1},
                        {'domain': 3, 'measure': 3},
                        {'domain': 4, 'measure': 2.3},
                        {'domain': 5, 'measure': 3},
                      ],
                    },
                    {
                      'id': 'Line 2',
                      'data': [
                        {'domain': 1, 'measure': 4},
                        {'domain': 2, 'measure': 5},
                        {'domain': 3, 'measure': 4.5},
                        {'domain': 4, 'measure': 7},
                        {'domain': 5, 'measure': 8},
                      ],
                    },
                    {
                      'id': 'Line 3',
                      'data': [
                        {'domain': 1, 'measure': 8.2},
                        {'domain': 2, 'measure': 8},
                        {'domain': 3, 'measure': 9},
                        {'domain': 4, 'measure': 10},
                        {'domain': 5, 'measure': 12},
                      ],
                    },
                  ],
                  includePoints: true,
                  includeArea: true,
                ),
              ),
            ),
        
              ]),
        ),
    ));
  }
}