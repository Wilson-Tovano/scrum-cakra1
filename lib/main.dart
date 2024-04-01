import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: EmptyPage(),
      ),
    );
  }
}

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Size W is ${MediaQuery.of(context).size.width}");
    debugPrint("Size H is ${MediaQuery.of(context).size.height}");
    var pixRatio = MediaQuery.of(context).devicePixelRatio;
    debugPrint(
      "Corrected size W is ${MediaQuery.of(context).size.width * pixRatio}",
    );
    debugPrint(
      "Corrected size H is ${MediaQuery.of(context).size.height * pixRatio}",
    );
    return Center(
      child: Container(
        width: 1080 / pixRatio,
        height: 2280 / pixRatio,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(24, 0, 119, 15),
              Color.fromRGBO(54, 0, 0, 15),
            ]
          )
        ),
        child: const Column(
          children: [
            // All code here
          ],
        ),
      ),
    );
  }
}
