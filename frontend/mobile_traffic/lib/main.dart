import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('mobile Traffic'),
        ),
        body: Container(
          color: Colors.blueGrey[600],
          child: Center(
            child: Text(
              'starting of our project',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
