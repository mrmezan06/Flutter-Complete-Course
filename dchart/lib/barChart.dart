import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  const BarChart({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(title: const Center(child: Text('Bar Chart'))),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            ListTile(
              title: const Text('Bar Chart'),
                tileColor: Colors.green[200],
            ),
        
            // Vertical Bar Chart
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AspectRatio(
                aspectRatio: 16/9,
                child: DChartBar(
                  data: const [
                      {
                        'id': 'Bar',
                        'data': [
                          {'domain': '2020', 'measure': 3},
                          {'domain': '2021', 'measure': 4},
                          {'domain': '2022', 'measure': 6},
                          {'domain': '2023', 'measure': 0.3},
                        ],
                      },
                    ],
                     barColor: (barData, index, id) => Colors.green,
                     domainLabelPaddingToAxisLine: 16,
                      axisLineTick: 2,
                      axisLinePointTick: 2,
                      axisLinePointWidth: 10,
                      axisLineColor: Colors.green,
                      measureLabelPaddingToAxisLine: 16,
                      showBarValue: true,
              ),
              )
          ),
          // Horizontal Bar Chart
          Padding(
                padding: const EdgeInsets.all(16),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: DChartBar(
                    data: const [
                      {
                        'id': 'Bar',
                        'data': [
                          {'domain': '2020', 'measure': 3},
                          {'domain': '2021', 'measure': 4},
                          {'domain': '2022', 'measure': 6},
                          {'domain': '2023', 'measure': 1.3},
                        ],
                      },
                    ],
                    domainLabelPaddingToAxisLine: 16,
                    axisLineColor: Colors.green,
                    measureLabelPaddingToAxisLine: 16,
                    barColor: (barData, index, id) => Colors.green,
                    verticalDirection: false,
                  ),
                ),
              ),
              // Vertical Bar With Color Changing based on Value
              Padding(
                padding: const EdgeInsets.all(16),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: DChartBar(
                    data: const [
                      {
                        'id': 'Bar',
                        'data': [
                          {'domain': '2020', 'measure': 3},
                          {'domain': '2021', 'measure': 4},
                          {'domain': '2022', 'measure': 6},
                          {'domain': '2023', 'measure': 0.3},
                        ],
                      },
                    ],
                    domainLabelPaddingToAxisLine: 16,
                    axisLineTick: 2,
                    axisLinePointTick: 2,
                    axisLinePointWidth: 8,
                    axisLineColor: Colors.green,
                    measureLabelPaddingToAxisLine: 16,
                    barColor: (barData, index, id) => barData['measure'] >= 4
                        ? Colors.green.shade300
                        : Colors.green.shade700,
                    barValue: (barData, index) => '${barData['measure']}',
                    showBarValue: true,
                    barValuePosition: BarValuePosition.auto,
                  ),
                ),
              ),
              // Horizontal Bar with color changing based on value
              Padding(
                padding: const EdgeInsets.all(16),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: DChartBar(
                    data: const [
                      {
                        'id': 'Bar',
                        'data': [
                          {'domain': '2020', 'measure': 3},
                          {'domain': '2021', 'measure': 4},
                          {'domain': '2022', 'measure': 6},
                          {'domain': '2023', 'measure': 0.3},
                        ],
                      },
                    ],
                    yAxisTitle: 'Year',
                    xAxisTitle: 'Sale',
                    measureMin: 0,
                    measureMax: 7,
                    minimumPaddingBetweenLabel: 1,
                    domainLabelPaddingToAxisLine: 16,
                    axisLineTick: 2,
                    axisLinePointTick: 2,
                    axisLinePointWidth: 10,
                    axisLineColor: Colors.green,
                    measureLabelPaddingToAxisLine: 16,
                    verticalDirection: false,
                    barColor: (barData, index, id) => barData['measure'] >= 4
                        ? Colors.green.shade300
                        : Colors.green.shade700,
                    barValue: (barData, index) => '${barData['measure']}%',
                    showBarValue: true,
                    barValuePosition: BarValuePosition.outside,
                  ),
                ),
              ),
              // Horizontal Bar With Comparing 2 data
              Padding(
                padding: const EdgeInsets.all(16),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: DChartBar(
                    data: const [
                      {
                        'id': 'Bar 1',
                        'data': [
                          {'domain': '2019', 'measure': 3},
                          {'domain': '2020', 'measure': 3},
                          {'domain': '2021', 'measure': 4},
                          {'domain': '2022', 'measure': 6},
                          {'domain': '2023', 'measure': 0.3},
                        ],
                      },
                      {
                        'id': 'Bar 2',
                        'data': [
                          {'domain': '2020', 'measure': 4},
                          {'domain': '2021', 'measure': 5},
                          {'domain': '2022', 'measure': 2},
                          {'domain': '2023', 'measure': 1},
                          {'domain': '2024', 'measure': 2.5},
                        ],
                      },
                    ],
                    yAxisTitle: 'Year',
                    xAxisTitle: 'Sale',
                    measureMin: 0,
                    measureMax: 8,
                    minimumPaddingBetweenLabel: 1,
                    domainLabelPaddingToAxisLine: 16,
                    axisLineTick: 2,
                    axisLinePointTick: 2,
                    axisLinePointWidth: 10,
                    axisLineColor: Colors.green,
                    measureLabelPaddingToAxisLine: 16,
                    barColor: (barData, index, id) => id == 'Bar 1'
                        ? Colors.green.shade300
                        : Colors.green.shade900,
                    barValue: (barData, index) => '${barData['measure']}%',
                    showBarValue: true,
                    barValuePosition: BarValuePosition.outside,
                    verticalDirection: false,
                  ),
                ),
              ),
              // Vertical Bar With Comparing 3 data
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const RotatedBox(
                      quarterTurns: 1,
                      child: Text(
                        'Year',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          AspectRatio(
                            aspectRatio: 16 / 9,
                            child: DChartBar(
                              data: const [
                                {
                                  'id': 'Bar 1',
                                  'data': [
                                    {'domain': '2020', 'measure': 32},
                                    {'domain': '2021', 'measure': 43},
                                    {'domain': '2022', 'measure': 29},
                                    {'domain': '2023', 'measure': 16},
                                  ],
                                },
                                {
                                  'id': 'Bar 2',
                                  'data': [
                                    {'domain': '2020', 'measure': 24},
                                    {'domain': '2021', 'measure': 42},
                                    {'domain': '2022', 'measure': 9},
                                    {'domain': '2023', 'measure': 37},
                                  ],
                                },
                                {
                                  'id': 'Bar 3',
                                  'data': [
                                    {'domain': '2020', 'measure': 17},
                                    {'domain': '2021', 'measure': 28},
                                    {'domain': '2022', 'measure': 12},
                                    {'domain': '2023', 'measure': 30},
                                  ],
                                },
                              ],
                              minimumPaddingBetweenLabel: 1,
                              domainLabelPaddingToAxisLine: 16,
                              axisLineTick: 2,
                              axisLinePointTick: 2,
                              axisLinePointWidth: 10,
                              axisLineColor: Colors.green,
                              measureLabelPaddingToAxisLine: 16,
                              barColor: (barData, index, id) => id == 'Bar 1'
                                  ? Colors.green.shade300
                                  : id == 'Bar 2'
                                      ? Colors.green.shade600
                                      : Colors.green.shade900,
                              barValue: (barData, index) =>
                                  '${barData['measure']}',
                              showBarValue: true,
                              barValueFontSize: 12,
                              barValuePosition: BarValuePosition.outside,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              'Year',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
        
              ]),
        ),
    ));
  }
}