import 'package:flutter/material.dart';
import 'components/CustomCard.dart';

class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Text('Weather App'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Column(children: [
          CustomCard(direction: 'row'),
          CustomCard(direction: 'column'),
        ]),
      ),
    );
  }
}
