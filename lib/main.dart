import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: EmptyPage(),
      ),
    );
  }
}

class EmptyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Size W is ${MediaQuery.of(context).size.width}");
    print("Size H is ${MediaQuery.of(context).size.height}");
    var pixRatio = MediaQuery.of(context).devicePixelRatio;
    print(
        "Corrected size W is ${MediaQuery.of(context).size.width * pixRatio}");
    print(
        "Corrected size H is ${MediaQuery.of(context).size.height * pixRatio}");
    return Center(
      child: Container(
        width: 1080 / pixRatio,
        height: 2280 / pixRatio,
        color: Colors.grey,
        child: Column(
          children: [
            //all code here
          ],
        ),
      ),
    );
  }
}
