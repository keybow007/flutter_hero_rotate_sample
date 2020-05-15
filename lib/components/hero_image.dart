import 'package:flutter/material.dart';

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
          child: Image.asset(
            imageUrl,
            fit: BoxFit.fill,),
        ),
      ),
    );
  }
}
