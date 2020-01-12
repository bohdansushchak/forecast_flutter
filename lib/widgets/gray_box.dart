import 'package:flutter/material.dart';

class GrayBox extends StatelessWidget {
  final Widget child;
  final EdgeInsets margin;

  GrayBox({@required this.child, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: margin,
      color: Colors.transparent,
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
          padding: EdgeInsets.all(5),
          child: child,
        ),
      ),
    );
  }
}
