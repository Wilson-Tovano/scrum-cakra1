import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double pixRatio = mediaQuery.devicePixelRatio;

    return Center(
      child: Container(
        width: 1080 / pixRatio,
        height: 2280 / pixRatio,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(24, 0, 119, 1),
              Color.fromRGBO(54, 0, 0, 1),
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}
