import 'package:flutter/material.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start App'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'this is a start project with most of most used packages and some custom widgets',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
