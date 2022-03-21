import 'package:flutter/material.dart';

class TableWidget extends StatefulWidget {
  const TableWidget({Key? key}) : super(key: key);

  @override
  State<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  @override
  Widget build(BuildContext context) {
    TableRow _tableRow = const TableRow(
      children: [
        Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Cell 1'),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text('Cell 2'),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text('Cell 3'),
        ),
      ]
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Table Widget'),
      ),
      body: Center(
        child: Table(
          border: TableBorder.all(),
          defaultColumnWidth: const FixedColumnWidth(120.0),
          children: [
            _tableRow,
            _tableRow,
            _tableRow,
            _tableRow,
            _tableRow,
          ],
        ),
      ),
    );
  }
}
