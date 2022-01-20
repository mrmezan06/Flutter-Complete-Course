import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:json_parsing/model/post.dart';

class JsonParsingMap extends StatefulWidget {
  const JsonParsingMap({Key? key}) : super(key: key);

  @override
  _JsonParsingMapState createState() => _JsonParsingMapState();
}

class _JsonParsingMapState extends State<JsonParsingMap> {
  late Future<PostList> data;

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
          title: Text("PODO"),
        ),
        body: Center(
          child: Container(
            child: FutureBuilder(
              future: getData(),
              builder: (context, AsyncSnapshot snapshot) {
                if(snapshot.hasData){
                  print("Data ready");
                  return createListView(snapshot.data!.posts, context);
                } else{
                  print("${snapshot.toString()}");
                  return CircularProgressIndicator();
                }

              },
            ),
          ),
        ),
      );
    }

  Future<PostList> getData() async {
    // String url = "https://jsonplaceholder.typicode.com/posts";
    // var url = Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});
    var url =
    Uri.https('jsonplaceholder.typicode.com', '/posts',);
    return Network(url).loadPosts();
    // data.then((value){
    //   print(value[0]['title']);
    // });
   // print(data.toString());
   // return data;
  }

    Widget createListView(List<Post> data, BuildContext context) {
      //print(data[0].title);
      return Container(
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, int index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Divider(height: 5.0),
                  ListTile(
                    title: Text("${data[index].title}"),
                    subtitle: Text("${data[index].body}"),
                    leading: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black26,
                          radius: 23,
                          child: Text("${data[index].id}"),
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
  Future<PostList> loadPosts() async {
    final response = await get(url);
    if ( response.statusCode == 200 ){
      print(response.body);
      return PostList.fromJson(json.decode(response.body));
    }else{
      print("Exception to load posts");
      throw Exception("Failed to get posts");
    }
  }

}
