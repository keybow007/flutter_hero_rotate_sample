import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:herosample/components/hero_image.dart';
import 'dart:math' as math;

import 'package:matrix4_transform/matrix4_transform.dart';

class DetailScreen extends StatefulWidget {
  final String url;
  final String tag;

  DetailScreen({this.url, this.tag});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Widget _baseWidget;
  Widget _displayWidget;

  //bool _isRotated = false;
  int _quarterTurns = 0;
  int _rotateCount = 0;

  @override
  void initState() {
    _baseWidget = HeroImage(
      tag: widget.tag,
      imageUrl: widget.url,
      onTap: () => _rotate(),
    );
    _displayWidget = _baseWidget;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      floatingActionButton: FloatingActionButton(
//        onPressed: () => _rotate(),
//        child: Icon(Icons.rotate_right),
//      ),
      //TODO SpeedDial
      //https://pub.dev/packages/flutter_speed_dial
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0),
        children: [
          SpeedDialChild(
            child: Icon(Icons.rotate_right),
            label: "Rotate",
            backgroundColor: Colors.blueAccent,
            labelBackgroundColor: Colors.blueAccent,
            onTap: () => _rotate(),
          ),
          SpeedDialChild(
            child: Icon(Icons.transform),
            label: "Transform",
            backgroundColor: Colors.redAccent,
            labelBackgroundColor: Colors.redAccent,
            onTap: () => _transform(),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(widget.url),
      ),
      body: Center(
        child: Container(
          child: _displayWidget,
        ),
      ),
    );
  }

  _rotate() {
    _rotateCount += 1;

    _displayWidget = RotatedBox(
      quarterTurns: _rotateCount,
      child: HeroImage(
        tag: widget.tag,
        imageUrl: widget.url,
        onTap: null,
      ),
    );

    setState(() {});
  }

  //TODO transform
  //https://api.flutter.dev/flutter/widgets/Transform-class.html
  _transform() {
    _rotateCount += 1;

    _displayWidget = Transform.rotate(
        angle: math.pi * (0.5) * _rotateCount,
      child: HeroImage(
        tag: widget.tag,
        imageUrl: widget.url,
        onTap: null,
      ),
    );

    setState(() {});
  }
}
