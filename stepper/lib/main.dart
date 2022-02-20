import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Stepper'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Stepper(
          steps: const [
            Step(
                title: Text('Step 1'),
                content: Text('Information for step 1')
            ),
            Step(
                title: Text('Step 2'),
                content: Text('Information for step 2')
            ),
            Step(
                title: Text('Step 3'),
                content: Text('Information for step 3')
            ),
          ],
          onStepTapped: (int newIndex){
            setState(() {
            _currentStep = newIndex;
          });
            },
          currentStep: _currentStep,
          onStepContinue: (){
            if(_currentStep != 2){
             setState(() {
               _currentStep += 1;
             });
            }
          },
          onStepCancel: (){
            if(_currentStep != 0){
              setState(() {
                _currentStep -= 1;
              });
            }
          },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
