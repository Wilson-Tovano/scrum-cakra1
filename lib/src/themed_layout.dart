import 'package:flutter/material.dart';

class ThemedLayout extends StatelessWidget {
  const ThemedLayout({
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
        color: Theme.of(context).colorScheme.background,
        child: child,
      ),
    );
  }
}
