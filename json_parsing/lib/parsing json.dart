import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class JSON_Parsing extends StatefulWidget {
  const JSON_Parsing({Key? key}) : super(key: key);

  @override
  _JSON_ParsingState createState() => _JSON_ParsingState();
}

class _JSON_ParsingState extends State<JSON_Parsing> {
  late Future data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parsing JSON"),
      ),
      body: Center(
        child: Container(
          child: FutureBuilder(
            future: getData(),
            builder: (context,AsyncSnapshot snapshot){
              if(snapshot.hasData){
                //return Text(snapshot.data[0]['title']);
                return createListView(snapshot.data, context);
              }
              return const CircularProgressIndicator();

            },
          ),
        ),
      ),
    );
  }
  Future getData() async {
    var data;
    // String url = "https://jsonplaceholder.typicode.com/posts";
    // var url = Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});
    var url =
    Uri.https('jsonplaceholder.typicode.com', '/posts',);
    data = Network(url).fetchData();
     // data.then((value){
     //   print(value[0]['title']);
     // });
    return data;
  }

  Widget createListView(List data, BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: data.length,
          itemBuilder: (context, int index){
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Divider(height: 5.0),
            ListTile(
              title: Text("${data[index]["title"]}"),
              subtitle: Text("${data[index]["body"]}"),
              leading: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black26,
                    radius: 23,
                    child: Text("${data[index]["id"]}"),
                  )
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}

class Network{
  final Uri url;

  Network(this.url);

  Future fetchData() async{
    print("$url");
    Response response = await get(url);
    if( response.statusCode == 200){
      // print(response.body);
      return json.decode(response.body);
    }else{
      print(response.statusCode);
    }
  }

}
