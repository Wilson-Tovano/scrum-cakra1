import 'dart:ui';

import 'package:flutter/material.dart';

class BlurryDialog extends StatelessWidget {
  final String title;
  final String content;
  const BlurryDialog({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.pop(context),
          )
        ]
      ),
    );
  }
}


