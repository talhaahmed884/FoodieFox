// TODO Implement this library.
import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget {
  final String _assetPath;
  ImageBanner(this._assetPath);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(
          height: 250.0,
        ),
        decoration: BoxDecoration(color: Colors.white),
        child: Image.asset(_assetPath, fit: BoxFit.cover));
  }
}
