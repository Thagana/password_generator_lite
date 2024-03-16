import 'package:flutter/material.dart';

class StatusBar extends StatelessWidget {
  const StatusBar({required this.color, super.key});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Container(
        height: 5,
        width: 35,
        color: color,
      ),
    );
  }
}
