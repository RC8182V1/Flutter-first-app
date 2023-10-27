import 'package:flutter/material.dart';

class AppsContainer extends StatelessWidget {
  const AppsContainer(
      {super.key, required this.containerHeight, required this.app});

  final double containerHeight;
  final Widget app;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        height: containerHeight,
        child: app,
      ),
    );
  }
}

