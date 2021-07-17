import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Text("Our latest products"),
        centerTitle: true
      ),
      body: Center(
        child: Text("Feed"),
      ),
    );
  }
}