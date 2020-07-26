import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class HeroImage extends StatelessWidget {
  final String imageUrl;
  final String tag;
  final VoidCallback onTap;

  HeroImage({this.imageUrl, this.tag, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Material(
        child: InkWell(
          onTap: onTap,
          //TODO photoView
          //https://pub.dev/packages/photo_view
          child: PhotoView(
            imageProvider: AssetImage(
              imageUrl
            ),
          ),
//          child: Image.asset(
//            imageUrl,
//            fit: BoxFit.contain,
//          ),
        ),
      ),
    );
  }
}
