import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';


class MyImage extends StatelessWidget {
  const MyImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("AppBar", style: TextStyle(letterSpacing: 4, fontSize: 24, fontWeight: FontWeight.bold),)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Image(
                  height: 200,
                  width: 200,
                  image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                ),
                Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg', height: 200,width: 200,)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network('https://picsum.photos/250?image=9', height: 200,width: 200,),
                Image.network(
                  'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif', height: 200,width: 200,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    const Center(
                      child: CircularProgressIndicator(
                        color: Colors.lightBlue,
                      ),
                    ),
                    Center(
                      child: FadeInImage.memoryNetwork(
                        width: 200,
                        height: 200,
                        placeholder: kTransparentImage, // 'assets/loading.gif',
                        image: 'https://picsum.photos/250?image=5',
                      ),
                    )
                  ]
                ),
                CachedNetworkImage(
                  width: 200,
                  height: 200,
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  imageUrl: 'https://picsum.photos/250?image=7',
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}
