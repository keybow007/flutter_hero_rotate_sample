import 'package:flutter/material.dart';
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
  bool _isRotated = false;
  int _quarterTurns = 0;

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
      floatingActionButton: FloatingActionButton(
        onPressed: () => _rotate(),
        child: Icon(Icons.rotate_left),
      ),
      appBar: AppBar(
        title: Text(widget.url),
      ),
      body: Center(
        child: AnimatedContainer(
          child: _displayWidget,
          duration: Duration(milliseconds: 1000),
          curve: Curves.ease,
        ),
      ),
    );
  }

  _rotate() {
    _isRotated = !_isRotated;
    _displayWidget = RotatedBox(
        quarterTurns: 3,
        child: HeroImage(
          tag: widget.tag,
          imageUrl: widget.url,
          onTap: () => _rotate(),
        )
    );

    setState(() {

    });
  }
}
