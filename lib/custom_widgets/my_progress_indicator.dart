import 'package:flutter/material.dart';

class MyProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            padding: EdgeInsets.all(8),
            width: 40,
            height: 40,
            child: CircularProgressIndicator()));
  }
}
