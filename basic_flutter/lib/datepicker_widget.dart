import 'package:flutter/material.dart';

class ShowDateTimePicker extends StatefulWidget {
  const ShowDateTimePicker({Key? key}) : super(key: key);

  @override
  _ShowDateTimePickerState createState() => _ShowDateTimePickerState();
}

class _ShowDateTimePickerState extends State<ShowDateTimePicker> {
  DateTime _dateTime = DateTime(2100);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('DateTimePicker Widget'),
    ),
    body:Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${_dateTime.day}-${_dateTime.month}-${_dateTime.year}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 60),),
          ElevatedButton(onPressed: () async{
            DateTime? newDate = await showDatePicker(
                context: context,
                initialDate: _dateTime,
                firstDate: DateTime(1800),
                lastDate: DateTime(3000)
            );
            if(newDate != null){
              setState(() {
                _dateTime = newDate;
              });
            }

          }, child: const Text('Get Date'))
        ],
      ),
    )
    );
  }
}
