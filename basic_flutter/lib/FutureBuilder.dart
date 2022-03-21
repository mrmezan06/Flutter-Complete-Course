import 'package:flutter/material.dart';

class FutureBuilderData extends StatefulWidget {
  const FutureBuilderData({Key? key}) : super(key: key);

  @override
  State<FutureBuilderData> createState() => _FutureBuilderDataState();
}

Future<String> getData() async{
  await Future.delayed(const Duration(seconds: 1));
  //throw 'An error occured';
  return 'It works';
}

class _FutureBuilderDataState extends State<FutureBuilderData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Builder'),
      ),
      body: Center(
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot){
            if( snapshot.connectionState == ConnectionState.waiting){
              return const CircularProgressIndicator();
            }
            if(snapshot.hasError){
              return Text(snapshot.error.toString());
            }else{
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(snapshot.data.toString()),
                  ElevatedButton(onPressed: (){
                    setState(() {
                    });
                  }, child: const Text('Refresh'))
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
