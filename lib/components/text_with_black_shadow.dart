import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class TextWithBlackShadow extends StatelessWidget {
  const TextWithBlackShadow({
    Key key,
    this.text,
    this.textStyle
  }): super(key: key);

  final String text;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Positioned(
            top: 2,
            left: 2,
            child: Text(
              text,
              style: textStyle.copyWith(color: Colors.black),
            ),
          ),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: Text(text, style: textStyle)
          )
        ]
    );
  }
}