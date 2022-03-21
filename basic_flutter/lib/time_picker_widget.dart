import 'package:flutter/material.dart';

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget({Key? key}) : super(key: key);

  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {

  TimeOfDay selectedTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("TimePicker Widget"),
      ),
      body: Center(
        child: Text("${selectedTime.hour}:${selectedTime.minute}", style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.access_time_outlined),
        onPressed: () async{
          _selectTime(context);
        },
      ),
    );
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
      );
    if(timeOfDay != null && timeOfDay != selectedTime)
    {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }



}
