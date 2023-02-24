import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  const MyTab({super.key, this.label, this.child});

  final String? label;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      child: label != null ? Text(label!) : child,
    );
  }
}
