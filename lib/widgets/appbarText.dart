import 'package:flutter/material.dart';

class AppBarText extends StatelessWidget {
  

   AppBarText({
    super.key,
    required this.title,
    required this.color,
  });

  @override
    final String title;
  final Color color;

  Widget build(BuildContext context) {
    return  Text(
    title,
      style: TextStyle(
          color: color!, fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
