import 'package:flutter/material.dart';
import 'package:herosample/components/photo_info.dart';
import 'package:herosample/screens/detail_screen.dart';
import 'package:herosample/components/hero_image.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero Sample2"),
      ),
      body: GridView.count(
        //flutter how to give height to the childrens of GridView.Builder
        //https://stackoverflow.com/questions/53612200/flutter-how-to-give-height-to-the-childrens-of-gridview-builder?rq=1
        childAspectRatio: 4 / 3,
        crossAxisCount: 2,
        children: _buildGridItems(context),
      ),
    );
  }

  _buildGridItems(BuildContext context) {
    return List.generate(photoInfoList.length, (int index) {
      return Card(
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: InkWell(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: HeroImage(
                    tag: photoInfoList[index].url,
                    imageUrl: photoInfoList[index].url,
                    onTap: () =>
                        _enlargeImage(context, photoInfoList[index].url),
                  ),
                ),
                Text(photoInfoList[index].name),
              ],
            ),
          ),
        ),
      );
    });
  }

  _enlargeImage(BuildContext context, String url) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => DetailScreen(url: url, tag: url,)
    ));
  }
}
